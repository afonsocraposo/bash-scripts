import pandas as pd
from selenium import webdriver
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
import time


df = pd.read_csv("/home/robot/Downloads/madalenaa.sobral-following-500-500.csv")
usernames = list(df["User ID"])

only_fans = "https://onlyfans.com/"

driver = webdriver.Firefox()

for i, username in enumerate(usernames):
    url = only_fans + username

    driver.get(url)
    try:
        element_present = EC.presence_of_element_located(
            (By.CLASS_NAME, "m-content-one-column")
        )
        WebDriverWait(driver, 10).until(element_present)
        element_present = EC.presence_of_element_located(
            (By.CLASS_NAME, "b-404__title")
        )
        try:
            WebDriverWait(driver, 5).until(element_present)
        except TimeoutException:
            pass
        try:
            found = driver.find_element_by_class_name("g-user-username")
        except Exception as e:
            found = False
        print(
            "{}/{} User: {} - Onlyfans: {}".format(
                i, len(usernames), username, "GOT HER!" if found else "nothing"
            )
        )
        if found:
            input()
    except TimeoutException:
        print("Timed out waiting for page to load")
