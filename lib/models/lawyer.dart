class Lawyer {
  final String type;
  final String name;
  final String image;
  final String description;
  final String analysisSpeed;
  final String accuracyRate;
  final int documentsProcessed;

  Lawyer({
    required this.type,
    required this.name,
    required this.image,
    required this.description,
    required this.analysisSpeed,
    required this.accuracyRate,
    required this.documentsProcessed,
  });
}

final List<Lawyer> lawyers = [
  Lawyer(
    type: "Family Lawyer",
    name: "Raghav Verma",
    image: "assets/img/1.png",
    description:
        "Raghav Verma is a highly respected family law expert with years of experience in handling sensitive family disputes, including divorce, custody, and inheritance matters. Known for his compassionate yet strategic approach, Raghav ensures that his clients receive fair and balanced solutions while minimizing emotional stress. He combines in-depth legal knowledge with practical advice to protect the best interests of families.",
    analysisSpeed: "95%",
    accuracyRate: "98%",
    documentsProcessed: 1250,
  ),
  Lawyer(
    type: "Property Lawyer",
    name: "Riya Kapoor",
    image: "assets/img/2.png",
    description:
        "Riya Kapoor is a distinguished property lawyer specializing in real estate transactions, property disputes, and land acquisition matters. With meticulous attention to detail and a strong understanding of property laws, she ensures smooth ownership transfers, resolves legal complications, and protects her clients’ investments. Her ability to foresee potential issues and provide practical solutions makes her a trusted advisor in all property-related matters.",
    analysisSpeed: "90%",
    accuracyRate: "97%",
    documentsProcessed: 980,
  ),
  Lawyer(
    type: "Business Lawyer",
    name: "Vivaan Aggarwal",
    image: "assets/img/3.png",
    description:
        "Vivaan Aggarwal is a seasoned business lawyer renowned for helping startups, SMEs, and large corporations navigate the complex legal landscape. He provides expert guidance on contracts, corporate governance, compliance, and risk management, ensuring businesses operate smoothly and within the law. Vivaan’s pragmatic approach and deep understanding of corporate law make him a valuable partner for long-term business growth.",
    analysisSpeed: "92%",
    accuracyRate: "96%",
    documentsProcessed: 1100,
  ),
  Lawyer(
    type: "Startup / Tech Lawyer",
    name: "Tanvi Desai",
    image: "assets/img/4.png",
    description:
        "Tanvi Desai is a dynamic legal advisor specializing in startups, technology ventures, and intellectual property. She assists entrepreneurs in setting up businesses, securing investments, protecting innovations, and scaling operations efficiently. Tanvi’s in-depth knowledge of tech law, combined with her strategic foresight, ensures that startups can focus on growth while staying fully compliant and legally secure.",
    analysisSpeed: "94%",
    accuracyRate: "99%",
    documentsProcessed: 870,
  ),
  Lawyer(
    type: "Criminal Lawyer",
    name: "Priyanka Nair",
    image: "assets/img/5.png",
    description:
        "Priyanka Nair is a formidable criminal lawyer known for her exceptional courtroom skills and dedication to justice. She handles criminal defense cases ranging from minor offenses to complex criminal matters with precision and unwavering commitment. Priyanka’s strategic approach, persuasive advocacy, and thorough understanding of criminal law empower her clients to face legal challenges confidently and achieve favorable outcomes.",
    analysisSpeed: "88%",
    accuracyRate: "95%",
    documentsProcessed: 1320,
  ),
  Lawyer(
    type: "IP Lawyer",
    name: "Rishabh Jain",
    image: "assets/img/6.png",
    description:
        "Rishabh Jain is an expert in intellectual property law, specializing in patents, trademarks, copyrights, and trade secrets. He helps innovators, creators, and businesses protect their unique ideas and creations from infringement, ensuring that intellectual property is legally safeguarded. Rishabh combines legal expertise with strategic counsel to maximize the value of intellectual assets and promote innovation.",
    analysisSpeed: "93%",
    accuracyRate: "98%",
    documentsProcessed: 900,
  ),
  Lawyer(
    type: "Tax Lawyer",
    name: "Shreya Kapoor",
    image: "assets/img/7.png",
    description:
        "Shreya Kapoor is a highly skilled tax lawyer with extensive experience in taxation, compliance, and dispute resolution. She provides expert guidance to individuals and businesses, helping them optimize tax planning, navigate complex regulations, and resolve legal conflicts efficiently. Shreya’s meticulous approach and profound knowledge of tax law make her a trusted advisor for achieving financial and legal security.",
    analysisSpeed: "91%",
    accuracyRate: "97%",
    documentsProcessed: 1050,
  ),
  Lawyer(
    type: "Environmental Lawyer",
    name: "Meera Iyer",
    image: "assets/img/8.png",
    description:
        "Meera Iyer is a passionate environmental lawyer committed to protecting natural resources and promoting sustainable practices. She advises clients on environmental regulations, compliance, and eco-friendly initiatives while representing them in legal proceedings when necessary. Meera’s deep understanding of environmental law and her dedication to social responsibility make her an influential voice in protecting communities and the planet.",
    analysisSpeed: "89%",
    accuracyRate: "96%",
    documentsProcessed: 780,
  ),
  Lawyer(
    type: "Cyber Lawyer",
    name: "Karan Mehta",
    image: "assets/img/9.png",
    description:
        "Karan Mehta is a specialist in cyber law, data privacy, and digital security regulations. He assists individuals and organizations in navigating legal challenges related to cybercrime, online disputes, and data protection. With his expertise in emerging digital laws and sharp analytical skills, Karan ensures that clients are fully protected in the fast-evolving digital landscape, minimizing risks and ensuring compliance.",
    analysisSpeed: "95%",
    accuracyRate: "99%",
    documentsProcessed: 820,
  ),
  Lawyer(
    type: "Civil Lawyer",
    name: "Sneha Verma",
    image: "assets/img/10.png",
    description:
        "Sneha Verma is an accomplished civil lawyer who provides comprehensive legal solutions in civil disputes, contracts, property matters, and personal claims. Her client-focused approach combines deep legal knowledge with practical problem-solving, ensuring efficient and fair resolutions. Sneha’s reputation for professionalism, diligence, and achieving favorable outcomes makes her a trusted legal partner for individuals and organizations alike.",
    analysisSpeed: "90%",
    accuracyRate: "96%",
    documentsProcessed: 980,
  ),
];
