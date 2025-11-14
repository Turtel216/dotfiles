return {
  {
    "Civitasv/cmake-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      cmake_command = "cmake",
      cmake_build_directory = "build",
      cmake_build_type = "Debug",
      cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
      cmake_kits_path = ".cmake/kits.json",
    },
  },
}
