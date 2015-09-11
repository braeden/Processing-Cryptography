surface.setVisible(false);

boolean encode = true; //Encode/decode switch
String input = "Hello this is a Caesar Cipher!";
int shift = 4;
int oldshift = shift; //Old shift for decode return
if (!encode) {
  int tempshift = shift % 26; //Divide by 26 and find remainder with modulus to decode
  shift = 26 - tempshift; //Decode is the same as encode expect the shift is subtracted from 26
}
char modified; //The modified char for each iteration
String encoded = "";
for(int i = 0; i < input.length(); i++) {
 int tempshift = shift % 26; //Reset tempshift for each loop
 if (Character.isUpperCase(input.charAt(i))) { //Uppercase
  if (int(input.charAt(i)) + tempshift > 90) { //If the current char and the tempshift are greater than 'Z'
    tempshift -= 90-int(input.charAt(i)); //Loop around
    modified = char(65+tempshift-1);
  } else {
    modified = char(input.charAt(i) + tempshift);
  }
  encoded = encoded + str(modified); //Append to string
 } else if (Character.isLowerCase(input.charAt(i))) {
  if (int(input.charAt(i)) + tempshift > 122) { //Lowercase
    tempshift -= 122-int(input.charAt(i)); //If the current char and the tempshift are greater than 'z'
    modified = char(97+tempshift-1); //Loop around
  } else {
    modified = char(input.charAt(i) + tempshift);
  }
  encoded = encoded + str(modified); //Append to string
 } else {
  encoded = encoded + str(input.charAt(i)); //Append normally if not a letter
 }
}
if (!encode) { //Decode return
  println("Decoded with shift of " + oldshift + ":");
  println(encoded);
} else { //Encode return
  println("Encoded with shift of " + shift + ":");
  println(encoded);
}