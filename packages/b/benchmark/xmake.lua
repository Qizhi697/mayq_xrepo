package("benchmark")

    set_homepage("https://github.com/google/benchmark")
    set_description("A microbenchmark support library")
    set_license("Apache-2.0")

    add_urls("https://github.com/google/benchmark/archive/v$(version).tar.gz",
             "https://github.com/google/benchmark.git")
    add_versions("1.5.2", "dccbdab796baa1043f04982147e67bb6e118fe610da2c65f88912d73987e700c")
    add_versions("1.5.3", "e4fbb85eec69e6668ad397ec71a3a3ab165903abe98a8327db920b94508f720e")
    add_versions("1.5.4", "e3adf8c98bb38a198822725c0fc6c0ae4711f16fbbf6aeb311d5ad11e5a081b5")
    add_versions("1.5.5", "3bff5f237c317ddfd8d5a9b96b3eede7c0802e799db520d38ce756a2a46a18a0")
    add_versions("1.5.6", "789f85b4810d13ff803834ea75999e41b326405d83d6a538baf01499eda96102")
    add_versions("1.6.0", "1f71c72ce08d2c1310011ea6436b31e39ccab8c2db94186d26657d41747c85d6")
    add_versions("1.6.1", "6132883bc8c9b0df5375b16ab520fac1a85dc9e4cf5be59480448ece74b278d4")
    add_versions("1.7.0", "3aff99169fa8bdee356eaa1f691e835a6e57b1efeadb8a0f9f228531158246ac")
    add_versions("1.7.1", "6430e4092653380d9dc4ccb45a1e2dc9259d581f4866dc0759713126056bc1d7")

    -- if is_plat("mingw") and is_subhost("msys") then
    --     add_extsources("pacman::benchmark")
    -- elseif is_plat("linux") then
    --     add_extsources("pacman::benchmark", "apt::libbenchmark-dev")
    -- elseif is_plat("macosx")then
    --     add_extsources("brew::google-benchmark")
    -- end

    -- if is_plat("linux") then
    --     add_syslinks("pthread")
    -- elseif is_plat("windows") then
    --     add_syslinks("shlwapi")
    -- end

    -- add_deps("cmake")
    -- add_links("benchmark_main", "benchmark")
    -- add_links("benchmark")

    on_install("macosx", "linux", "windows", function (package)
        -- local configs = {"-DBENCHMARK_DOWNLOAD_DEPENDENCIES=on","-DCMAKE_BUILD_TYPE=Release", "-DCMAKE_CXX_FLAGS=\'-D_GLIBCXX_USE_CXX11_ABI=0\'"}
        -- table.insert(configs, "-DCMAKE_BUILD_TYPE=" .. (package:debug() and "Debug" or "Release"))
        -- table.insert(configs, "-DBUILD_SHARED_LIBS=" .. (package:config("shared") and "ON" or "OFF"))
        -- import("package.tools.cmake").install(package, configs)
        os.vrun("cmake -DBENCHMARK_DOWNLOAD_DEPENDENCIES=on -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS='-D_GLIBCXX_USE_CXX11_ABI=0' -DCMAKE_INSTALL_PREFIX=%s", package:installdir())
        os.vrun("make -j74")
        os.vrun("make install")
    end)
