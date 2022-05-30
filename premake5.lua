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
IncludeDir["Glad"] = "JTEngine/vendor/Glad/include"
IncludeDir["ImGui"] = "JTEngine/vendor/imgui"


include "JTEngine/vendor/GLFW"
include "JTEngine/vendor/Glad"
include "JTEngine/vendor/imgui"



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
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.Glad}",
		"%{IncludeDir.ImGui}"
	}

	links
	{
		"GLFW",
		"Glad",
		"ImGui",
		"opengl32.lib"
	}



	filter "system:windows"
		cppdialect "C++20"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"JTE_PLATFORM_WINDOWS",
			"JTE_BUILD_DLL",
			"GLFW_INCLUDE_NONE"
		}
		
		postbuildcommands 
		{
			("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
		}

	filter "configurations:Debug"
		defines "JTE_DEBUG"
		buildoptions "/MDd"
		symbols "On"

	filter "configurations:Release"
		defines "JTE_Release"
		buildoptions "/MDd"
		optimize "On"

	filter "configurations:Dist"
		defines "JTE_DIST"
		buildoptions "/MDd"
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
		buildoptions "/MDd"
		symbols "On"

	filter "configurations:Release"
		defines "JTE_Release"
		buildoptions "/MDd"
		optimize "On"

	filter "configurations:Dist"
		defines "JTE_DIST"
		buildoptions "/MDd"
		optimize "On"

