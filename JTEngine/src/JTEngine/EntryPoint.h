#pragma once
//#include <JTEngine.h>

#ifdef JTE_PLATFORM_WINDOWS


extern JTEngine::Application* JTEngine::CreateApplication();

int main(int argc, char** argv)
{

	JTEngine::Log::Init();
	
	JTE_CORE_WARN("Initialized Log!");

	JTE_INFO("Hi!");


	printf("JTEngine\n");
	auto app = JTEngine::CreateApplication();
	app->Run();
	delete app;
}


#endif // JTE_PLATFORM_WINDOWS
 