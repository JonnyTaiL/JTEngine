#pragma once


#ifdef JTE_PLATFORM_WINDOWS
	#ifdef JTE_BUILD_DLL
		#define JTENGINE_API __declspec(dllexport)
	#else
#define JTENGINE_API __declspec(dllimport)
	#endif
#else
	#error JTEngine only support windows
#endif


#ifdef JTE_ENABLE_ASSERTS
	#define JTE_ASSERT(x, ...){if(!(x)) {JTE_ERROR("Asserting Failed: {0}", __VA_ARGS__); __debugbreak(); } }
	#define JTE_CORE_ASSERT(x, ...){if(!(x)) {JTE_CORE_ERROR("Asserting Failed: {0}", __VA_ARGS__); __debugbreak(); } }
#else
	#define JTE_ASSERT(x, ...)
	#define JTE_CORE_ASSERT(x, ...)
#endif

#define BIT(x) (1 << x)

#define JTE_BIND_EVENT_FN(fn) std::bind(&fn, this, std::placeholders::_1)