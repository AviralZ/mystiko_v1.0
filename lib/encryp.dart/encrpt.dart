String XORChiper(String orignalString) {
  String xorKey = 'P';

  int len = orignalString.length;
  int d1;
  String d2 = '';

  for (int i = 0; i < len; i++) {
    int c = orignalString.codeUnitAt(i);
    int c1 = xorKey.codeUnitAt(0);
    d1 = (c ^ c1);
    // print(d1);

//          d2+=(d1.toString());
    d2 += String.fromCharCode(d1);
  }
  return d2;
}
