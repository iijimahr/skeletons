"""
Sample script for nanobind
2024-03-21: initial commit
"""

import my_module

if __name__ == "__main__":
    print(my_module.__name__)
    assert my_module.add(1.0, 2.0) == 3.0

    struct = my_module.SampleStruct()
    info = struct.get_info()
    print(info)
    assert info["array_size"] == 1
    assert info["int_param"] == 2
    assert info["double_param"] == 1.0
    assert isinstance(info["array"], list)
    assert len(info["array"]) == info["array_size"]

    struct = my_module.SampleStruct(5)
    info = struct.get_info()
    print(info)
    assert info["array_size"] == 5
    assert info["int_param"] == 2
    assert info["double_param"] == 1.0
    assert isinstance(info["array"], list)
    assert len(info["array"]) == info["array_size"]
