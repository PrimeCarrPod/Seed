                byte[] tile00 = readAllBytes(context.getAssets().open("Tile00.prime"));
                byte[] tile01 = context.getAssets().open("Tile01.prime") != null ? 
                    readAllBytes(context.getAssets().open("Tile01.prime")) : new byte[0];
                byte[] tile02 = context.getAssets().open("Tile02.prime") != null ? 
                    readAllBytes(context.getAssets().open("Tile02.prime")) : new byte[0];
                byte[] tile03 = context.getAssets().open("Tile03.prime") != null ? 
                    readAllBytes(context.getAssets().open("Tile03.prime")) : new byte[0];

                primeTiles.add(tile00);
                if (tile01.length > 0) primeTiles.add(tile01);
                if (tile02.length > 0) primeTiles.add(tile02);
                if (tile03.length > 0) primeTiles.add(tile03);

                primeCount = parsePrimeCount(tile00);
                if (tile01.length > 0) primeCount += parsePrimeCount(tile01);
                if (tile02.length > 0) primeCount += parsePrimeCount(tile02);
                if (tile03.length > 0) primeCount += parsePrimeCount(tile03);

                primeGaps.addAll(computePrimeGaps(tile00));
                if (tile01.length > 0) primeGaps.addAll(computePrimeGaps(tile01));
