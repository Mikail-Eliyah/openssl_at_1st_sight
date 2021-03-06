
#include <stdio.h>
#include <string.h>

#include <openssl/x509.h>
#include <openssl/evp.h>
#include <openssl/hmac.h>

void print_hex(unsigned char *buf, int len)
{
  int i;
  int n;

  for(i=0,n=0;i<len;i++){
    //if(n > 7){
    //  printf("\n");
    //  n = 0;
    //}
    printf("%02x",buf[i]);
    //n++;
  }
  printf("\n");
}

void hex_to_binary(unsigned char *buf, unsigned char *hex)
{
  for( ; sscanf( hex, "%2x", buf++ ) == 1 ; hex+=2 );
  *buf = 0;  // null terminate -- precaution
}

void PBKDF2_HMAC_SHA_256_string(const char* pass, const unsigned char* salt, int32_t iterations, uint32_t outputBytes, char* hexResult)
{
    unsigned int i;
    unsigned char digest[outputBytes];
    PKCS5_PBKDF2_HMAC(pass, strlen(pass), salt, strlen(salt), iterations, EVP_sha256(), outputBytes, digest);
    for (i = 0; i < sizeof(digest); i++)
        sprintf(hexResult + (i * 2), "%02x", 255 & digest[i]);
}

void PBKDF2_HMAC_SHA_384_string(const char* pass, const unsigned char* salt, int32_t iterations, uint32_t outputBytes, char* hexResult)
{
    unsigned int i;
    unsigned char digest[outputBytes];
    PKCS5_PBKDF2_HMAC(pass, strlen(pass), salt, strlen(salt), iterations, EVP_sha384(), outputBytes, digest);
    for (i = 0; i < sizeof(digest); i++)
        sprintf(hexResult + (i * 2), "%02x", 255 & digest[i]);
}

void PBKDF2_HMAC_SHA_512_string(const char* pass, const unsigned char* salt, int32_t iterations, uint32_t outputBytes, char* hexResult)
 {
     unsigned int i;
     unsigned char digest[outputBytes];
     PKCS5_PBKDF2_HMAC(pass, strlen(pass), salt, strlen(salt), iterations, EVP_sha512(), outputBytes, digest);
     for (i = 0; i < sizeof(digest); i++)
         sprintf(hexResult + (i * 2), "%02x", 255 & digest[i]);
 }   
 
 void PBKDF2_HMAC_SHA_1nat_string(const char* pass, const unsigned char* salt, int32_t iterations, uint32_t outputBytes, char* hexResult)
{
    unsigned int i;
    unsigned char digest[outputBytes];
    PKCS5_PBKDF2_HMAC_SHA1(pass, strlen(pass), salt, strlen(salt), iterations, outputBytes, digest);
    for (i = 0; i < sizeof(digest); i++)
        sprintf(hexResult + (i * 2), "%02x", 255 & digest[i]);
}

#define outputBytes 32	// number of bytes

int main(argc, argv)
  int argc;
  char *argv[];
{
  unsigned char pass[1024];      // passphrase read from stdin
  unsigned char salt[1024];      // salt (binary)
  int salt_len;                  // salt length in bytes
  int iteration_count;                        // iterative count
  // unsigned char result[1024];       // result (binary - 32+16 chars)

  // 2*outputBytes+1 is 2 hex bytes per binary byte, 
	// and one character at the end for the string-terminating \0
	char result[2*outputBytes+1];
	memset(result,0,sizeof(result));
  
  if ( argc != 3 ) {
    fprintf(stderr, "usage: %s salt count <passwd >binary_key_iv\n", argv[0]);
    exit(10);
  }

  // hex_to_binary(salt, argv[1]);
  sscanf (argv[1],"%s",&salt);
  salt_len = strlen(argv[1])/2;   /* WARNING: assume it is a even number! */

  iteration_count = atoi(argv[2]);

  fgets(pass, 1024, stdin);
  if ( pass[strlen(pass)-1] == '\n' )
    pass[strlen(pass)-1] = '\0';

#if DEBUG
  // PBKDF 1.5 
  // NOTE: this is used by "openssl enc" but only with iteration_count value of 1
  // This make brute force dictionary attacks posible!!!!  -- Arrggghh
  EVP_BytesToKey(EVP_aes_256_cbc(), EVP_sha1(), salt, pass, strlen(pass),
         iteration_count, result, result+32);
  printf("EVP_BytesToKey(\"%s\", \"%s\", %d)=\n", pass, salt, iteration_count);
  print_hex(result, 32);     // Key   (as hex)
  print_hex(result+32, 16);  // IV   (as hex)
#endif

  // PBKDF 2
  // PKCS5_PBKDF2_HMAC_SHA1(pass, strlen(pass), salt, salt_len, iteration_count, 32+16, result);
  printf ("pass: %s\n", pass);
  printf ("salt: %s\n", salt);
  printf ("iteration_count: %d\n\n", iteration_count);
  PBKDF2_HMAC_SHA_256_string(pass, salt, iteration_count, outputBytes, result);
  // PBKDF2_HMAC_SHA_1nat_string(pass, salt, iteration_count, outputBytes, result);

  //print_hex(result, 32+16);  // Key + IV   (as hex)
#if DEBUG
  printf("PKCS5_PBKDF2_HMAC_SHA1(\"%s\", \"%s\", %d)=\n", pass, salt, iteration_count);
  print_hex(result, 32);               // Key   (as hex)
  print_hex(result+32, 16);            // IV   (as hex)
  //fwrite(result, 1, 32+16, stdout);  // Key + IV (as binary)
#else
  //print_hex(result, 32+16);            // Key + IV   (as hex string)
  printf("%s\n", result);
#endif

  return(0);
}

/*
Ref: https://asecuritysite.com/encryption/PBKDF2_2
0C60C80F961F0E71F3A9B524AF6012062FE037A6
echo -n "password" | ./pbkdf2 "salt" 1
http://stackoverflow.com/questions/5130513/pbkdf2-hmac-sha2-test-vectors
120fb6cffcf8b32c43e7225256c4f837a86548c92ccc35480805987cb70be17b
echo -n "password" | ./pbkdf2 "salt" 1
*/

/*
** SYNOPSIS
**   function derive_key { echo -n "$1" | ./pbkdf2 "$2" "$3"; }
**
** Ref : test program "pkcs5.c" found on
**   http://www.mail-archive.com/openssl-users@openssl.org
** which uses openssl to perform PBKDF2 (RFC2898) iteritive (slow) password
** hashing.
**
** Build
**    gcc -o pbkdf2 pbkdf2.c -lssl
**
**    [Ursa]
**    <Compilation>:
** 	  gcc -o pbkdf2 pbkdf2.c -lcrypto
**    or
**    gcc -o pbkdf2 pbkdf2.c -lssl -lcrypto 
**
**    <Usage>:
**    echo -n <passcode> | ./pbkdf2 <salt> <number_of_rounds> 
**    echo -n "ayahuasca" | ./pbkdf2 "to.see.the.world.in.a.grain.of.sand" 100000 
**    <Output>:
**    32-byte hex strings.
**
** DESCRIPTION
**
** Make the "Password-Based Key Derivation Function v2" function found in
** the openssl library available to the command line, as it is not available
** for use from the "openssl" command.  At the time of writing the "openssl"
** command only encrypts using the older, 'fast' pbkdf1.5 method.
**
** The 'salt_hex' is the salt to be used, as a hexadecimal string. Typically
** this is 8 bytes (64 bit), and is an assigned randomly during encryption.
**
** The 'count' is iteration count used to make the calculation of the key
** from the passphrase longer so as to take 1/2 to 2 seconds to generate.
** This complexity prevents slows down brute force attacks enormously.
**
** The output of the above is a 48 bytes in hexadeximal, which is typically
** used for 32 byte encryption key KEY and a 16 byte IV as needed by
** Crypt-AES-256 (or some other encryption method).
**
** NOTE: While the "openssl" command can accept a hex encoded 'key' and 'iv'
** it only does so on the command line, which is insecure.  As such I
** recommend that the output only be used with API access to the "OpenSSL"
** cryptography libraries.
**
** FUTURE: Provide an optional argument to specify the Key+IV output size wanted.  As given above it currently defaults to 48 bytes (32 key + 16 iv) or 32 bytes if IV is not disclosed. IV need not be a secret, but we can choose not to diclose it.
**
*************
**
** Ursa (Walnuss Technology Group, unit: Ayahuasca)
** Version: 2017-05-21_1705hr
** 
*/