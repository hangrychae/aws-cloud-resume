import unittest
import requests

class TestMyWebsite(unittest.TestCase):
    def test_homepage_loads(self):
        response = requests.get('https://chaecloudresume.com/')
        self.assertEqual(response.status_code, 200)

    def test_about_page_links(self):
        response = requests.get('https://chaecloudresume.com/#about.html')
        self.assertEqual(response.status_code, 200)
        # self.assertIn('Contact', response.content.decode())
	

if __name__ == '__main__':
    unittest.main()