#include <iostream>

#define FindAsset(FilePath) CONTENT_PATH FilePath

int main(int argc, char* argv[])
{
	std::cout << "Hello World" << "\n";
	std::cout << "Argument Count: " << argc << "\n";

	std::cout << "Content/AppData Path: " << CONTENT_PATH << "\n";
	std::cout << "FindAsset Path: " << FindAsset("Texture/Button.png") << "\n";

	std::cout << "MyPath: " << argv[0] << "\n";

	if (argc >= 2) std::cout << "DropFilePath1: " << argv[1] << "\n";

	if(argc >=3) std::cout << "DropFilePath2: " << argv[2] << "\n";

	system("pause");

	return 0;
}