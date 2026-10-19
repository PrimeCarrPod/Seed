## 8. Formulas Reference

| # | Formula | Description | Section |
|---|---------|-------------|---------|
| 1 | $ES_i = \max_{j \in pred(i)} EF_j$ | Early Start (Forward Pass) | 1.2 |
| 2 | $EF_i = ES_i + Duration_i$ | Early Finish | 1.2 |
| 3 | $LF_i = \min_{j \in succ(i)} LS_j$ | Late Finish (Backward Pass) | 1.2 |
| 4 | $LS_i = LF_i - Duration_i$ | Late Start | 1.2 |
| 5 | $Float_i = LS_i - ES_i$ | Total Float | 1.2 |
| 6 | $FCR = \frac{\sum (Float_{base} - Float_{curr})}{\Delta t}$ | Float Consumption Rate | 1.3 |
| 7 | $PV = \sum Budget_{planned}$ | Planned Value | 2.2 |
| 8 | $EV = \sum Budget_{earned}$ | Earned Value | 2.2 |
| 9 | $AC = \sum Cost_{actual}$ | Actual Cost | 2.2 |
| 10 | $CPI = EV/AC$ | Cost Performance Index | 2.2 |
| 11 | $SPI = EV/PV$ | Schedule Performance Index | 2.2 |
| 12 | $TCPI = (BAC - EV)/(EAC - AC)$ | To-Complete Performance Index | 2.2 |
| 13 | $CV = EV - AC$ | Cost Variance | 2.2 |
| 14 | $SV = EV - PV$ | Schedule Variance | 2.2 |
| 15 | $EAC_1 = AC + (BAC - EV)$ | EAC Method 1 | 2.2 |
| 16 | $EAC_2 = AC + (BAC - EV)/CPI$ | EAC Method 2 | 2.2 |
| 17 | $EAC_3 = AC + (BAC - EV)/(CPI \times SPI)$ | EAC Method 3 | 2.2 |
| 18 | $RPN = P \times S \times D$ | Risk Priority Number | 3.3 |
| 19 | $JCL = P(Cost \leq C_{target} \land Schedule \leq S_{target})$ | Joint Confidence Level | 3.4 |
| 20 | $Y_x = A \cdot x^b$ | Crawford Unit Learning Curve | 4.3 |
| 21 | $b = \ln(LC\%)/\ln(2)$ | Learning Exponent | 4.3 |
| 22 | $\bar{C}_N = T_1 N^{b+1}/(b+1)$ | Cumulative Average Cost | 4.3 |
| 23 | $Fee = Fee_{target} + \text{share} \times (Target - Actual)$ | Incentive Fee Calculation | 5.1 |
| 24 | $RSI = 1 - (N_{chg} + N_{add} + N_{del})/N_{base}$ | Requirements Stability Index | 6.2 |

---
