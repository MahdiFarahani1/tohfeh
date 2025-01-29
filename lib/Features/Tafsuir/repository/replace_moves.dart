String replaceMoves(String content) {
  String fontMoves = 'assets/fonts/abo.ttf';
  content = content.replaceAll("(عليها السلام)",
      "<span class='AboThar' style='font-family: \"$fontMoves\";'></span>");
  content = content.replaceAll("(صلي الله عليه وآله)",
      "<span class='AboThar' style='font-family: \"$fontMoves\";'></span>");
  content = content.replaceAll("(صلي الله عليه و آله)",
      "<span class='AboThar' style='font-family: \"$fontMoves\";'></span>");
  content = content.replaceAll("(صلى الله عليه و آله)",
      "<span class='AboThar' style='font-family: \"$fontMoves\";'></span>");
  content = content.replaceAll("(صلى الله عليه وآله)",
      "<span class='AboThar' style='font-family: \"$fontMoves\";'></span>");
  content = content.replaceAll("(صلي الله عليه وسلم)",
      "<span class='AboThar' style='font-family: \"$fontMoves\";'></span>");
  content = content.replaceAll("(صلی الله علیه و آله و سلم)",
      "<span class='AboThar' style='font-family: \"$fontMoves\";'></span>");
  content = content.replaceAll("(صلى الله عليه وآله وسلم)",
      "<span class='AboThar' style='font-family: \"$fontMoves\";'></span>");
  content = content.replaceAll("(ص)",
      "<span class='AboThar' style='font-family: \"$fontMoves\";'></span>");
  content = content.replaceAll("(عليه السلام)",
      "<span class='AboThar' style='font-family: \"$fontMoves\";'></span>");
  content = content.replaceAll("(رحمه الله)",
      "<span class='AboThar' style='font-family: \"$fontMoves\";'></span>");
  content = content.replaceAll("(ع)",
      "<span class='AboThar' style='font-family: \"$fontMoves\";'></span>");
  content = content.replaceAll("(عجل الله تعالي و فرجه)",
      "<span class='AboThar' style='font-family: \"$fontMoves\";'></span>");
  content = content.replaceAll("(قدس سره)",
      "<span class='AboThar' style='font-family: \"$fontMoves\";'></span>");
  content = content.replaceAll("(عجل الله فرجه الشريف)",
      "<span class='AboThar' style='font-family: \"$fontMoves\";'></span>");
  content = content.replaceAll("(عجل الله تعالى و فرجه)",
      "<span class='AboThar' style='font-family: \"$fontMoves\";'></span>");
  content = content.replaceAll("(علیه السلام)",
      "<span class='AboThar' style='font-family: \"$fontMoves\";'></span>");
  content = content.replaceAll("(رضي الله عنه)",
      "<span class='AboThar' style='font-family: \"$fontMoves\";'></span>");
  content = content.replaceAll("﴿",
      "<span class='AboThar' style='font-family: \"$fontMoves\";'></span>");
  content = content.replaceAll("﴾",
      "<span class='AboThar' style='font-family: \"$fontMoves\";'></span>");
  content = content.replaceAll("{",
      "<span class='AboThar' style='font-family: \"$fontMoves\";'></span>");
  content = content.replaceAll("}",
      "<span class='AboThar' style='font-family: \"$fontMoves\";'></span>");
  return content;
}
