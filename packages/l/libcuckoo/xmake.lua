package("libcuckoo")
    set_homepage("https://github.com/efficient/libcuckoo")
    set_description("libcuckoo provides a high-performance, compact hash table that allows multiple concurrent reader and writer threads.")
    set_license("BSL")

    add_urls("https://github.com/efficient/libcuckoo/archive/refs/tags/v$(version).tar.gz",
             "https://github.com/efficient/libcuckoo.git")
    add_versions("0.3.1", "a87122b963ef6b7eadca3e41cb4b533f3b6ad9b588ab2f2140eb6ab0db9a7ba8")

    add_deps("cmake")
    on_install("linux", function (package)
        local configs = {"-DBUILD_EXAMPLES=1","-DBUILD_TESTS=1","-DBUILD_UNIT_TESTS=1","-DBUILD_STRESS_TESTS=1","-DBUILD_UNIVERSAL_BENCHMARK=1"}
        table.insert(configs, "-DCMAKE_BUILD_TYPE=" .. (package:debug() and "Debug" or "Release"))
        import("package.tools.cmake").install(package, configs)
    end)