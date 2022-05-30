#pragma once

#include "JTEngine/Core.h"
#include "Layer.h"

#include <vector>


namespace JTEngine {

	class LayerStack
	{
	public:
		LayerStack();
		~LayerStack();


		void Push_Layer(Layer* layer);
		void Push_Overlay(Layer* overlay);
		void Pop_Layer(Layer* layer);
		void Pop_Overlay(Layer* overlay);

		std::vector<Layer*>::iterator begin() { return m_Layers.begin(); }
		std::vector<Layer*>::iterator end() { return m_Layers.end(); }

	private:
		std::vector<Layer*> m_Layers;
		std::vector<Layer*>::iterator m_LayerInsert;

		//JTEngine::Layer Layers[];
	};

}

 