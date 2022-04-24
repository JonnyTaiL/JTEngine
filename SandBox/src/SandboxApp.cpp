
#include <JTEngine.h>


class Sandbox : public JTEngine::Application
{

public:

	Sandbox()
	{

	}

	~Sandbox()
	{

	}

};


JTEngine::Application* JTEngine::CreateApplication()
{
	return new Sandbox();
}