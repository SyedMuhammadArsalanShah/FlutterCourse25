// Lecture 04: Switch Statement in Dart
// Instructor: Syed M Arsalan Shah

void main() {
  // Vowel Checker using Switch Statement
  String vowels = 'z';

  switch (vowels) {
    case 'A':
    case 'a':
      {
        print("It's a vowel: $vowels");
        break;
      }
    case 'E':
    case 'e':
      {
        print("It's a vowel: $vowels");
        break;
      }
    case 'I':
    case 'i':
      {
        print("It's a vowel: $vowels");
        break;
      }
    case 'O':
    case 'o':
      {
        print("It's a vowel: $vowels");
        break;
      }
    case 'U':
    case 'u':
      {
        print("It's a vowel: $vowels");
        break;
      }
    default:
      {
        print("It's not a vowel: $vowels");
      }
  }
}
