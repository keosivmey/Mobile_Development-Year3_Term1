enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String street;
  final String city;
  final String zipCode;

  const Address({required this.street, required this.city, required this.zipCode});
}

class Employee {
  final String _name;
  final List<Skill> _skills;
  final Address _address;
  final int _yearsOfExperience;

  // for Skill Bonuses the computeSalary() need this
  static const Map<Skill, double> _skillBonuses = {
    Skill.FLUTTER: 5000.0,
    Skill.DART: 3000.0,
  };

   // main constructor
  Employee({
    required String name,
    required List<Skill> skills, 
    required Address address,   
    required int yearsOfExperience, 
  })  : _name = name,
        _skills = skills,
        _address = address,
        _yearsOfExperience = yearsOfExperience;
  
  //add named constructor to a specific types of employees
  Employee.mobileDeveloper ({
    required String name,
    required Address address,
    int yearsOfExperience = 0,
  })
  : this( // to the main constructor
          name: name,
          skills: [Skill.FLUTTER, Skill.DART], // assign the specific skill
          address: address,
          yearsOfExperience: yearsOfExperience,
        );
  
  // getter 
  String get name => _name;
  List <Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  // a method to compute a salary
  double computeSalary() {
    const double baseSalary = 40000;
    const double yearOfExperienceBonus = 2000;
    const double otherSkillBonus = 1000; 

    double totalSalary = baseSalary;

    // Experience Bonus
    totalSalary += _yearsOfExperience * yearOfExperienceBonus;

    // Dynamic Skill Bonuses
    for (var skill in _skills) {
      // Use the map lookup. If the skill isn't in the map (like 'java' 
      // if it wasn't there it will defaults to the 'otherSkillBonus'.
      double bonus = _skillBonuses[skill] ?? otherSkillBonus;
      totalSalary += bonus;
    }

    return totalSalary;
  }

  void printDetails() {
    print('Employee: $_name');
    print('Address: stree: ${address.street}, city: ${address.city}, zipcode: ${address.zipCode}');
    print('Experience: $_yearsOfExperience yrs');
    print('Skills: ${_skills.map((s) => s.name).join(', ')}');
    print('Salary: \$${computeSalary().toStringAsFixed(2)}');

  }

}

void main() {
  const Address sivmeyHome = Address(street: '02', city: 'Phnom Penh', zipCode: 'idk');
  const Address eyeyHome = Address(street: '01', city: 'Phnom Penh', zipCode: 'idktoo');


  // using the named constructor (mobileDeveloper)
  var emp1 = Employee.mobileDeveloper(
    name: 'Sivmey', 
    address: sivmeyHome,
    yearsOfExperience: 1,
  );
  emp1.printDetails(); 

  // using the main constructor
  var emp2 = Employee(
    name: 'EyEy', 
    skills: [Skill.FLUTTER, Skill.OTHER],
    address: eyeyHome,
    yearsOfExperience: 3,
  );
  emp2.printDetails();
}