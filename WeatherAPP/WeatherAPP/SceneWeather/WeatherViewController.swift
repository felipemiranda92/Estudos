import UIKit

class WeatherViewController: UIViewController {
    
    var viewModel: WeatherViewModel = WeatherViewModel()
    
    @IBOutlet weak var cityNameTextField: UITextField!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configElements()
    }
    
    func configElements() {
        searchButton.setTitle("Pesquisar", for: .normal)
        cityNameTextField.placeholder = "Digite o nome da cidade"
        
        temperatureLabel.text = "Temperatura: "
        temperatureLabel.numberOfLines = 0
        temperatureLabel.lineBreakMode = .byWordWrapping
    }
    
    @IBAction func pressedButton(_ sender: UIButton) {
        
        guard let cityName = cityNameTextField.text, !cityName.isEmpty else {
            temperatureLabel.text = "Por favor, insira o nome da cidade."
            return
        }
        
        viewModel.fetchWeather(cityName: cityName) { [weak self] temperature in
            DispatchQueue.main.async {
                if let temperature = temperature {
                    self?.temperatureLabel.text = temperature
                } else {
                    self?.temperatureLabel.text = "Não foi possível obter a temperatura, digite uma cidade válida."
                }
            }
        }
    }
}
