surface.setVisible(false);

boolean encode = true; //Encode/decode switch
String input = "Hello this is not a Caesar Cipher!";
String phrase = "Secret";
phrase = phrase.toUpperCase();
char modified; //The modified char for each iteration
String encoded = "";
int tempShift;
int j = 0;
for(int i = 0; i < input.length(); i++) {
 char currentChar = input.charAt(i);
 if (j > phrase.length()-1) {
   j = 0;
 }
 char secretChar = phrase.charAt(j); 
 tempShift = int(secretChar) - 65;
 if (Character.isUpperCase(currentChar)) { //Uppercase
  if (int(currentChar) + tempShift > 90) { //If the current char and the tempShift are greater than 'Z'
    tempShift -= 90-int(currentChar); //Loop around
    modified = char(64+tempShift);  //'A' unicode -1 for offset
  } else {
    modified = char(currentChar + tempShift);
  }
  encoded = encoded + str(modified); //Append to string
  j++;
 } else if (Character.isLowerCase(currentChar)) { //Lowercase
  if (int(currentChar) + tempShift > 122) { //If the current char and the tempShift are greater than 'z'
    tempShift -= 122-int(currentChar); //Loop around 
    modified = char(96+tempShift); //'a' unicode -1 for offset
  } else {
    modified = char(currentChar + tempShift);
  }
  encoded = encoded + str(modified); //Append to string
  j++;
 } else {
  encoded = encoded + str(currentChar); //Append normally if not a letter
 }
}
if (!encode) { //Decode return
 // println("Decoded with shift of " + oldShift + ":");
  println(encoded);
} else { //Encode return
  //println("Encoded with shift of " + shift + ":");
  println(encoded);
}