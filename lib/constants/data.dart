class ConstantData {
  List<String> domainList = [
    "Development",
    "Design",
    "Infrastructure",
    "Security",
    "Data and Analytics",
    "Management",
    "Marketing"
  ];

  Map<String, List<String>> subDomainLists = {
    "Development": [
      "Front-end Development",
      "Back-end Development",
      "Full-stack Development",
      "App Development",
      "Game Development",
      "DevOps"
    ],
    "Design": [
      "UI/UX Design",
      "Graphic Design",
      "Motion Graphics and Animation",
      "3D Design and Modeling"
    ],
    "Infrastructure": [
      "Cloud Computing",
      "Networking",
      "Architecture and Deployment",
      "System Administration"
    ],
    "Security": [
      "Cyber Security",
      "Security Operations",
      "Ethical Hacking and Penetration Testing"
    ],
    "Data and Analytics": [
      "Data Science",
      "Business Intelligence",
      "Data Engineering",
      "Data Warehousing",
      "Data Governance and Compliance"
    ],
    "Management": [
      "Project Management",
      "Program Management",
      "Portfolio Management",
      "Change Management",
      "Risk Management",
      "Stakeholder Management"
    ],
    "Marketing": [
      "Digital Marketing",
      "Product Marketing",
      "Brand Management",
      "Market Research and Analytics"
    ]
  };

  List<String> sortList = [
    "Newest",
    "Oldest",
    "Popularity",
    "Start Date",
    "Project Duration",
    "Project Name (A-Z)",
    "Project Name (Z-A)"
  ];
}
