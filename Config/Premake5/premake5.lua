os.chdir('../../')
WorkspaceName = path.getbasename(os.getcwd())
ProjectName = WorkspaceName
ContentDir = '"' .. path.getabsolute('Content') .. '/"'

function Links()
    includedirs{ 'Config/ThirdParty/Include' }
    --links { '' }
end

workspace(WorkspaceName)

    configurations {'Debug', 'Release', 'Shipping'}
    platforms {'Win32', 'Win64'}

project(ProjectName).group = "Application"

    kind ('ConsoleApp')
    language ('C++')

    targetdir ('Binaries/%{cfg.platform}/%{cfg.buildcfg}')
    objdir ('Intermediate/Build')
    location ('Intermediate/ProjectFiles')

    ProjectPath = 'Source/'.. WorkspaceName
    os.mkdir('Content')
    os.mkdir(ProjectPath)

    includedirs{ 'Source', '%{ProjectPath}' }

    files {'Config/AppIcon/Resource.rc'}
    files { 'Source/**.h', 'Source/**.c', 'Source/**.hpp', 'Source/**.cpp' }

    vpaths {
        ['Config/Resouce/'] = {'Config/Resource.rc'},
        ['Source/*'] =  { 'Source/**.h', 'Source/**.c', 'Source/**.hpp', 'Source/**.cpp' },
        ['%{ProjectPath}'] = { '%{ProjectPath}/**.h', '%{ProjectPath}/**.c', '%{ProjectPath}/**.hpp', '%{ProjectPath}/**.cpp' }
    }

    Links()

    filter{'configurations:Debug'}
        defines {'DEBUG_MODE'}
        defines {'CONTENT_PATH=' .. ContentDir}
        symbols 'On'
        optimize "Off"
        
    filter{'configurations:Release'}
        defines {'RELEASE_MODE'}
        defines {'CONTENT_PATH=' .. ContentDir}
        symbols 'On'
        optimize "On"
        
    filter{'configurations:Shipping'}
        defines {'SHIPPING_MODE'}
        defines {'CONTENT_PATH="AppData/"'}
        symbols 'Off'
        optimize "On"

        FilesFrom = path.getabsolute("Content")
        FileTo = path.getabsolute("Binaries/%{cfg.platform}/%{cfg.buildcfg}/AppData")
        postbuildmessage "Copying Content Files..."
        -- copy a file from the objects directory to the target directory
        postbuildcommands { "{COPYDIR} %{FilesFrom} %{FileTo}" }

    filter{'configurations:Win32'}
        architecture ("x86")
        cppdialect "C++17"
        system ("windows")
        libdirs { 'Config/ThirdParty/libs/Win32' }
        
    filter{'configurations:Win64'}
        architecture ("x86_64")
        cppdialect "C++17"
        system ("windows")
        libdirs { 'Config/ThirdParty/libs/Win64' }

    filter "system:Unix"
        defines {'PLATFORM_UNIX'}
        system "linux"

    filter "system:Windows"
        defines {'PLATFORM_WINDOWS'}
        system "windows"
  
    filter "system:Mac"
        defines {'PLATFORM_MAC'}
        system "macosx"

    filter{}

    newaction {
        trigger     = "GeneratorVs2017",
        description = "Install the software",
        execute     = function ()
            Filename = "../../Project.bat";
            Content = 'cd "Config/Premake5"\n call premake5 vs2017'
            io.writefile(Filename, Content)
        end
    }

    newaction {
        trigger     = "GeneratorVs2019",
        description = "Install the software",
        execute     = function ()
            Filename = "../../Project.bat";
            Content = 'cd "Config/Premake5"\n call premake5 vs2019'
            io.writefile(Filename, Content)
        end
    }

    newaction {
        trigger     = "GeneratorVs2022",
        description = "Install the software",
        execute     = function ()
            Filename = "../../Project.bat";
            Content = 'cd "Config/Premake5"\n call premake5 vs2022'
            io.writefile(Filename, Content)
        end
     }