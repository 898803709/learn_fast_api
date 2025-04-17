import pytest

def add(a: int, b: int) -> int:
    return a + b




@pytest.mark.parametrize(
    "a, b, expected",
    [
        (1, 2, 3),
        (0, 0, 0),
        (-1, 1, 0),
        (1000000, 2000000, 3000000),
    ],
)
def test_normal(a, b, expected):
    assert add(a, b) == expected