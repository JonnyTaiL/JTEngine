#pragma once

#include <memory>

#include "Core.h"
#include "spdlog/spdlog.h"
#include "spdlog/fmt/ostr.h"


namespace JTEngine
{
	class JTENGINE_API Log
	{


	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;

	public:

		static void Init();

		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }

	};


}

// Core log macros
#define JTE_CORE_TRACE(...)		::JTEngine::Log::GetCoreLogger()->error(__VA_ARGS__)
#define JTE_CORE_INFO(...)		::JTEngine::Log::GetCoreLogger()->error(__VA_ARGS__)
#define JTE_CORE_WARN(...)		::JTEngine::Log::GetCoreLogger()->error(__VA_ARGS__)
#define JTE_CORE_ERROR(...)		::JTEngine::Log::GetCoreLogger()->error(__VA_ARGS__)
#define JTE_CORE_FATAL(...)		::JTEngine::Log::GetCoreLogger()->error(__VA_ARGS__)


// Client log macros
#define JTE_TRACE(...)		::JTEngine::Log::GetClientLogger()->error(__VA_ARGS__)
#define JTE_INFO(...)		::JTEngine::Log::GetClientLogger()->error(__VA_ARGS__)
#define JTE_WARN(...)		::JTEngine::Log::GetClientLogger()->error(__VA_ARGS__)
#define JTE_ERROR(...)		::JTEngine::Log::GetClientLogger()->error(__VA_ARGS__)
#define JTE_FATAL(...)		::JTEngine::Log::GetClientLogger()->error(__VA_ARGS__)


