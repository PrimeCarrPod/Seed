package com.bounce.tgapp

import android.os.Bundle
import android.util.Log
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.android.billingclient.api.*
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

class BillingActivity : AppCompatActivity(), PurchasesUpdatedListener {

    private var billingClient: BillingClient? = null
    private val featureGate = FeatureGate(this)

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_billing)

        billingClient = BillingClient.newBuilder(this)
            .setListener(this)
            .enablePendingPurchases()
            .build()

        billingClient?.startConnection(object : BillingClientStateListener {
            override fun onBillingSetupFinished(result: BillingResult) {
                if (result.responseCode == BillingClient.BillingResponseCode.OK) {
                    queryProducts()
                } else {
                    Toast.makeText(this@BillingActivity, "Billing setup failed: ${result.debugMessage}", Toast.LENGTH_LONG).show()
                    finish()
                }
            }

            override fun onBillingServiceDisconnected() {
                // Try to reconnect
            }
        })
    }

    private fun queryProducts() {
        val params = QueryProductDetailsParams.newBuilder()
            .setProductList(
                listOf(
                    QueryProductDetailsParams.Product.newBuilder()
                        .setProductId("pro_yearly_599")
                        .setProductType(BillingClient.ProductType.SUBS)
                        .build()
                )
            )
            .build()

        billingClient?.queryProductDetailsAsync(params) { result, productDetailsList ->
            if (result.responseCode == BillingClient.BillingResponseCode.OK && productDetailsList.isNotEmpty()) {
                val product = productDetailsList[0]
                launchPurchase(product)
            } else {
                Toast.makeText(this, "Product not found", Toast.LENGTH_LONG).show()
                finish()
            }
        }
    }

    private fun launchPurchase(product: ProductDetails) {
        val offerToken = product.subscriptionOfferDetails?.firstOrNull()?.offerToken ?: ""
        val params = BillingFlowParams.newBuilder()
            .setProductDetailsParamsList(
                listOf(
                    BillingFlowParams.ProductDetailsParams.newBuilder()
                        .setProductDetails(product)
                        .setOfferToken(offerToken)
                        .build()
                )
            )
            .build()

        billingClient?.launchBillingFlow(this, params)
    }

    override fun onPurchasesUpdated(result: BillingResult, purchases: MutableList<Purchase>?) {
        if (result.responseCode == BillingClient.BillingResponseCode.OK && purchases != null) {
            for (purchase in purchases) {
                handlePurchase(purchase)
            }
        } else if (result.responseCode == BillingClient.BillingResponseCode.USER_CANCELED) {
            Toast.makeText(this, "Purchase cancelled", Toast.LENGTH_SHORT).show()
            finish()
        } else {
            Toast.makeText(this, "Purchase failed: ${result.debugMessage}", Toast.LENGTH_LONG).show()
            finish()
        }
    }

    private fun handlePurchase(purchase: Purchase) {
        CoroutineScope(Dispatchers.IO).launch {
            try {
                val functions = com.google.firebase.functions.FirebaseFunctions.getInstance("us-central1")
                val callable = functions.getHttpsCallable("validateReceipt")
                val result = callable.call(com.google.firebase.ktx.hashMapOf(
                    "packageName" to packageName,
                    "productId" to purchase.products.firstOrNull() ?: "",
                    "purchaseToken" to purchase.purchaseToken
                )).await()

                val data = result.data as? java.util.Map<*, *> ?: return@launch
                val jwt = data["licenseJwt"] as? String ?: return@launch

                runOnUiThread {
                    featureGate.onLicenseUpdated(jwt)
                    Toast.makeText(this@BillingActivity, "Pro activated!", Toast.LENGTH_SHORT).show()
                    finish()
                }
            } catch (e: Exception) {
                Log.e("BillingActivity", "Validation failed", e)
                runOnUiThread {
                    Toast.makeText(this@BillingActivity, "Validation failed", Toast.LENGTH_LONG).show()
                }
            }
        }
    }

    override fun onDestroy() {
        billingClient?.endConnection()
        super.onDestroy()
    }
}