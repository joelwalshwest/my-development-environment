import unittest


class TestClass(unittest.TestCase):

    def test_thing(self):
        test = "lskjf"
        print(test)
        print("hello")
        self.assertEqual(1, 1)

    def test_another(self):
        self.assertTrue(True)


if __name__ == "__main__":
    unittest.main()
