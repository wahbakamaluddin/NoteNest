package com.notenest.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class HashUtil {

    /**
     * Generates an MD5 hash for the given password.
     *
     * @param password The password to hash.
     * @return The hashed password in hexadecimal format.
     * @throws NoSuchAlgorithmException If the MD5 algorithm is not available.
     */
    public static String getHashPass(String password) throws NoSuchAlgorithmException {
        // Initialize MessageDigest with MD5
        MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
        mdAlgorithm.update(password.getBytes());

        // Generate the hash as a byte array
        byte[] digest = mdAlgorithm.digest();

        // Convert byte array to hexadecimal string
        StringBuilder hexString = new StringBuilder();
        for (byte b : digest) {
            String hex = Integer.toHexString(0xFF & b);
            if (hex.length() < 2) {
                hex = "0" + hex; // Ensure two-digit hexadecimal format
            }
            hexString.append(hex);
        }

        return hexString.toString();
    }
}
