import unittest

class TestClass(unittest.TestCase):
    def test_thing(self):
        self.assertEqual(1, 1)

if __name__ == "__main__":
    unittest.main()

