
#include <JTEngine.h>

class ExampleLayer : public JTEngine::Layer
{
public:
	ExampleLayer()
		: Layer("Example")
	{
	}

	void OnUpdate() override
	{
		//JTE_INFO("ExampleLayer::Update");

		if (JTEngine::Input::IsKeyPressed(JTE_KEY_TAB))
			JTE_INFO("tab key is pressed!");
	}

	void OnEvent(JTEngine::Event& event) override
	{
		if (event.GetEventType() == JTEngine::EventType::KeyPressed)
		{
			JTEngine::KeyPressedEvent& e = (JTEngine::KeyPressedEvent&)event;
			JTE_TRACE("{0}", (char)e.GetKeyCode());

		}
	
	}
};


class Sandbox : public JTEngine::Application
{

public:

	Sandbox()
	{
		PushLayer(new ExampleLayer());
		PushOverlay(new JTEngine::ImGuiLayer());
	}

	~Sandbox()
	{

	}

};


JTEngine::Application* JTEngine::CreateApplication()
{
	return new Sandbox();
}