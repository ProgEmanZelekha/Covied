const String emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
// const String passwordPattern = r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*+=?-]).{8,15}$';
const String passwordPattern = r"(.|\\n){8,1000}$";
// const String namePattern = r'^[a-zA-Z\u0621-\u064A\u0660-\u0669](?!.*\\.\\.)[a-zA-Z\u0621-\u064A\u0660-\u0669.\\d\\s]{4,19}$';
const String namePattern = r"(.|\\n){2,100}$";
const String anyPattern = r"(.|\\n){3,1000}$";
const String anyNumPattern = r"(.|\\n){1,1000}$";
const String phonePattern = r'^01[0-2,5]{1}[0-9]{8}$';
