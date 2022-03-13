package seleniumTesting.GestioneCarrello;


// Generated by Selenium IDE
import org.junit.Test;
import org.junit.Before;
import org.junit.After;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.core.IsNot.not;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Alert;
import org.openqa.selenium.Keys;
import java.util.*;
import java.net.MalformedURLException;
import java.net.URL;
public class AggiuntaProdottiAlCarrelloTest {
  private WebDriver driver;
  private Map<String, Object> vars;
  JavascriptExecutor js;
  @Before
  public void setUp() {
    driver = new ChromeDriver();
    js = (JavascriptExecutor) driver;
    vars = new HashMap<String, Object>();
  }
  @After
  public void tearDown() {
    driver.quit();
  }
  @Test
  public void prodottoAggiuntoAlCarrello() {
    driver.get("http://localhost:8080/MusicConsole/");
    driver.manage().window().setSize(new Dimension(1410, 799));
    driver.findElement(By.cssSelector(".nav-item:nth-child(1) > .nav-link")).click();
    driver.findElement(By.name("nickname")).sendKeys("m.rossi");
    driver.findElement(By.name("password")).click();
    driver.findElement(By.name("password")).sendKeys("mario");
    driver.findElement(By.cssSelector("p > .bottoni")).click();
    driver.findElement(By.cssSelector(".blocco:nth-child(1) > a:nth-child(2) > .info")).click();
    driver.findElement(By.id("bott")).click();
    assertThat(driver.switchTo().alert().getText(), is("Elemento aggiunto al carrello"));
    assertThat(driver.getTitle(), is("Achille Lauro"));
  }
  @Test
  public void prodottoGiPresenteNelCarrello() {
    driver.get("http://localhost:8080/MusicConsole/");
    driver.manage().window().setSize(new Dimension(1410, 799));
    driver.findElement(By.cssSelector(".nav-item:nth-child(1) > .nav-link")).click();
    driver.findElement(By.name("nickname")).sendKeys("m.rossi");
    driver.findElement(By.name("password")).click();
    driver.findElement(By.name("password")).sendKeys("mario");
    driver.findElement(By.cssSelector("p > .bottoni")).click();
    driver.findElement(By.cssSelector(".blocco:nth-child(1) > a:nth-child(2) > .info")).click();
    driver.findElement(By.id("bott")).click();
    assertThat(driver.switchTo().alert().getText(), is("Elemento gia\' presente nel carrello"));
    assertThat(driver.getTitle(), is("Achille Lauro"));
  }
}
