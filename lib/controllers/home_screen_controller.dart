import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/trending_idea_model.dart';

class HomeScreenController extends GetxController {
  final trendingIdeas = <TrendingIdeaModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadDummyData();
  }

  void loadDummyData() {
    trendingIdeas.assignAll([
      TrendingIdeaModel(
        id: '1',
        name: "LinguaVR",
        tagline: "Immersive Language Learning",
        description: "A Virtual Reality platform where users practice new languages by talking to AI avatars in realistic scenarios like cafes or airports. Real-time pronunciation feedback included.",
        aiFeedback: "High retention potential. VR hardware adoption is the main bottleneck.",
        rating: 92,
        upvotes: 340,
        category: 'EdTech',
        createdAt: DateTime.now(),
      ),
      TrendingIdeaModel(
        id: '2',
        name: "AgriDrone",
        tagline: "Precision Farming Fleet",
        description: "Autonomous drone swarms that analyze soil health and hydration levels in real-time. Helps farmers reduce water usage by 30% while maximizing crop yield.",
        aiFeedback: "Strong B2B potential. Regulatory airspace clearance might be tricky.",
        rating: 88,
        upvotes: 215,
        category: 'AgTech',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      TrendingIdeaModel(
        id: '3',
        name: "ReWear",
        tagline: "Peer-to-Peer Fashion Rental",
        description: "A marketplace for renting high-end designer clothing from people in your neighborhood. Includes insurance and on-demand dry cleaning logistics.",
        aiFeedback: "Great sustainability angle. Logistics costs could eat into margins.",
        rating: 75,
        upvotes: 180,
        category: 'Fashion',
        createdAt: DateTime.now().subtract(const Duration(hours: 5)),
      ),
      TrendingIdeaModel(
        id: '4',
        name: "SolarShare",
        tagline: "Decentralized Energy Trading",
        description: "Allows homeowners with solar panels to sell excess electricity directly to their neighbors via blockchain smart contracts, bypassing the main grid.",
        aiFeedback: "Disruptive but faces heavy opposition from traditional utility companies.",
        rating: 81,
        upvotes: 410,
        category: 'GreenTech',
        createdAt: DateTime.now(),
      ),
      TrendingIdeaModel(
        id: '5',
        name: "MediMatch",
        tagline: "AI Diagnosis Triage",
        description: "An AI symptom checker that connects patients to the right specialist instantly. Integrates with insurance APIs to check coverage before booking.",
        aiFeedback: "High liability risk, but massive efficiency gains for hospitals.",
        rating: 65,
        upvotes: 95,
        category: 'HealthTech',
        createdAt: DateTime.now(),
      ),
      TrendingIdeaModel(
        id: '6',
        name: "CyberWipe",
        tagline: "Personal Data Eraser",
        description: "Scans the dark web and public databases for your personal info and automatically sends legal takedown requests (GDPR/CCPA) to remove it.",
        aiFeedback: "Growing market concern. Subscription model fits perfectly.",
        rating: 85,
        upvotes: 120,
        category: 'Security',
        createdAt: DateTime.now(),
      ),
      TrendingIdeaModel(
        id: '7',
        name: "UrbanHydro",
        tagline: "Smart Apartment Gardens",
        description: "Modular hydroponic wall units for growing vegetables in small apartments. Controlled via app for automated lighting and watering cycles.",
        aiFeedback: "Niche market, but high viral potential on social media.",
        rating: 78,
        upvotes: 150,
        category: 'Home & Living',
        createdAt: DateTime.now(),
      ),
      TrendingIdeaModel(
        id: '8',
        name: "GigSync",
        tagline: "Freelance Tax Autopilot",
        description: "Connects to all freelance platforms (Upwork, Uber, Fiverr) to automatically categorize income, set aside taxes, and generate invoices in one dashboard.",
        aiFeedback: "Solving a huge pain point. Competitive landscape is crowded.",
        rating: 84,
        upvotes: 290,
        category: 'FinTech',
        createdAt: DateTime.now(),
      ),
      TrendingIdeaModel(
        id: '9',
        name: "ElderCare AI",
        tagline: "Non-Intrusive Monitoring",
        description: "Uses existing WiFi signals to detect falls or unusual inactivity in elderly homes without cameras or wearables. Alerts family members instantly.",
        aiFeedback: "Privacy-friendly approach gives it a huge advantage.",
        rating: 89,
        upvotes: 330,
        category: 'HealthTech',
        createdAt: DateTime.now(),
      ),
      TrendingIdeaModel(
        id: '10',
        name: "PetPals",
        tagline: "Tinder for Dog Playdates",
        description: "Location-based social network to find playmates for your pets based on size, energy level, and temperament. Includes verified reviews for safety.",
        aiFeedback: "Fun concept, monetization might be difficult via ads alone.",
        rating: 60,
        upvotes: 85,
        category: 'Social',
        createdAt: DateTime.now(),
      ),
    ]);
  }

  List<TrendingIdeaModel> get topVotedIdeas =>
      List<TrendingIdeaModel>.from(trendingIdeas)
        ..sort((a, b) => b.upvotes.compareTo(a.upvotes));

  List<TrendingIdeaModel> get topRatedIdeas =>
      List<TrendingIdeaModel>.from(trendingIdeas)
        ..sort((a, b) => b.rating.compareTo(a.rating));

  void toggleUpvote(int index) {
    var idea = trendingIdeas[index];
    if (idea.isUpvoted) {
      idea.upvotes--;
      idea.isUpvoted = false;
    } else {
      idea.upvotes++;
      idea.isUpvoted = true;
    }
    trendingIdeas.refresh();
  }
}
