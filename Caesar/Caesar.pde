surface.setVisible(false);

boolean encode = true; //Encode/decode switch
String input = "Hello this is a Caesar Cipher!";
int shift = 4;
int oldShift = shift; //Old shift for decode return
if (!encode) {
  int tempShift = shift % 26; //Divide by 26 and find remainder with modulus to decode
  shift = 26 - tempShift; //Decode is the same as encode expect the shift is subtracted from 26
}
char modified; //The modified char for each iteration
String encoded = "";
for(int i = 0; i < input.length(); i++) {
 char currentChar = input.charAt(i);
 int tempShift = shift % 26; //Reset tempShift for each loop
 if (Character.isUpperCase(currentChar)) { //Uppercase
  if (int(currentChar) + tempShift > 90) { //If the current char and the tempShift are greater than 'Z'
    tempShift -= 90-int(currentChar); //Loop around
    modified = char(64+tempShift);
  } else {
    modified = char(currentChar + tempShift);
  }
  encoded = encoded + str(modified); //Append to string
 } else if (Character.isLowerCase(currentChar)) {
  if (int(currentChar) + tempShift > 122) { //Lowercase
    tempShift -= 122-int(currentChar); //If the current char and the tempShift are greater than 'z'
    modified = char(96+tempShift); //Loop around
  } else {
    modified = char(currentChar + tempShift);
  }
  encoded = encoded + str(modified); //Append to string
 } else {
  encoded = encoded + str(currentChar); //Append normally if not a letter
 }
}
if (!encode) { //Decode return
  println("Decoded with shift of " + oldShift + ":");
  println(encoded);
} else { //Encode return
  println("Encoded with shift of " + shift + ":");
  println(encoded);
}