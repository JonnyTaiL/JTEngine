workspace "JTEngine"
	architecture "x64"
	startproject "Sandbox"

	configurations
	{
		"Debug",
		"Resease",
		"Dist"
	}

	outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"


-- include directions relative to root folder (DolutionDir)
IncludeDir = {}
IncludeDir["GLFW"] = "JTEngine/vendor/GLFW/include"
include "JTEngine/vendor/GLFW"



project "JTEngine"
	location "JTEngine"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")


	pchheader "jtepch.h"
	pchsource "JTEngine/src/jtepch.cpp"



	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
		"%{IncludeDir.GLFW}"
	}

	links
	{
		"GLFW",
		"opengl32.lib"
	}



	filter "system:windows"
		cppdialect "C++20"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"JTE_PLATFORM_WINDOWS",
			"JTE_BUILD_DLL"
		}
		
		postbuildcommands 
		{
			("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
		}

	filter "configurations:Debug"
		defines "JTE_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "JTE_Release"
		optimize "On"

	filter "configurations:Dist"
		defines "JTE_DIST"
		optimize "On"



project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	
	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"JTEngine/vendor/spdlog/include",
		"JTEngine/src"
	}

	links
	{
		"JTEngine"
	}
	
	filter "system:windows"
		cppdialect "C++20"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"JTE_PLATFORM_WINDOWS"
		}
		

	filter "configurations:Debug"
		defines "JTE_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "JTE_Release"
		optimize "On"

	filter "configurations:Dist"
		defines "JTE_DIST"
		optimize "On"

