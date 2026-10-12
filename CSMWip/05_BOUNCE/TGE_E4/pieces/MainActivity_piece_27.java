            sb.append("[");
            for (int i = 0; i < primeTiles.size(); i++) {
                if (i > 0) sb.append(",");
                sb.append("\"");
                byte[] tile = primeTiles.get(i);
                for (int j = 0; j < tile.length; j++) {
                    if (j > 0) sb.append(",");
                    sb.append(tile[j] & 0xFF);
                }
                sb.append("\"");
            }
            sb.append("]");
            return sb.toString();
        }
    }
}