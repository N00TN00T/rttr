-- PREMAKE FOR RTTR

project "rttr"
    kind "StaticLib"
    language "C++"
    
	targetdir ("bin/" .. output_dir .. "/%{prj.name}")
    objdir ("bin-int/" .. output_dir .. "/%{prj.name}")

    files
    {
        "src/rttr/**.c",
        "src/rttr/**.h"
    }
    
	filter "system:windows"
        systemversion "latest"
        staticruntime "On"

    filter "system:linux"
        systemversion "latest"
        staticruntime "On"
        pic "On"

    filter "system:macosx"
        systemversion "latest"
        staticruntime "On"

    filter { "system:windows", "configurations:Release" }
        buildoptions "/MT"
        
    filter "configurations:Debug*"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release*"
        runtime "Release"
        optimize "On"

    filter "configurations:Dist*"
        runtime "Release"
        optimize "On"
