"""
Unit tests for src.chatbot module.
"""

import sys
from pathlib import Path

import pytest

PROJECT_ROOT = Path(__file__).resolve().parent.parent
if str(PROJECT_ROOT) not in sys.path:
    sys.path.insert(0, str(PROJECT_ROOT))

from src.chatbot import MENU, RestaurantChatbot


@pytest.fixture
def bot() -> RestaurantChatbot:
    """Return a fresh chatbot instance for each test."""
    return RestaurantChatbot()


class TestIntentDetection:
    """Tests for RestaurantChatbot.detect_intent."""

    @pytest.mark.parametrize(
        "message, expected",
        [
            ("Hello there!", "greeting"),
            ("Hi", "greeting"),
            ("Good morning", "greeting"),
            ("Hey", "greeting"),
        ],
    )
    def test_greeting(self, bot: RestaurantChatbot, message: str, expected: str) -> None:
        assert bot.detect_intent(message) == expected

    @pytest.mark.parametrize(
        "message, expected",
        [
            ("Bye!", "farewell"),
            ("Goodbye", "farewell"),
            ("Thank you", "farewell"),
            ("Thanks!", "farewell"),
        ],
    )
    def test_farewell(self, bot: RestaurantChatbot, message: str, expected: str) -> None:
        assert bot.detect_intent(message) == expected

    def test_menu_intent(self, bot: RestaurantChatbot) -> None:
        assert bot.detect_intent("Show me the menu") == "menu"

    def test_order_intent(self, bot: RestaurantChatbot) -> None:
        assert bot.detect_intent("I'd like to order a pizza") == "order"

    def test_recommend_intent(self, bot: RestaurantChatbot) -> None:
        assert bot.detect_intent("What do you recommend?") == "recommend"

    def test_bill_intent(self, bot: RestaurantChatbot) -> None:
        assert bot.detect_intent("Can I get the bill?") == "bill"

    def test_help_intent(self, bot: RestaurantChatbot) -> None:
        assert bot.detect_intent("Help me") == "help"

    def test_unknown_intent(self, bot: RestaurantChatbot) -> None:
        assert bot.detect_intent("qwertyuiop") == "unknown"


class TestRespond:
    """Tests for RestaurantChatbot.respond."""

    def test_greeting_response(self, bot: RestaurantChatbot) -> None:
        response = bot.respond("Hello!")
        assert "Welcome" in response
        assert bot.name in response

    def test_menu_response(self, bot: RestaurantChatbot) -> None:
        response = bot.respond("Show me the menu")
        assert "Menu" in response
        assert "Pizza" in response or "Bruschetta" in response

    def test_order_adds_item(self, bot: RestaurantChatbot) -> None:
        response = bot.respond("I want Margherita Pizza")
        assert "Added" in response or "Margherita Pizza" in response
        assert len(bot.order) == 1
        assert bot.order[0][0] == "Margherita Pizza"

    def test_order_unknown_item(self, bot: RestaurantChatbot) -> None:
        response = bot.respond("I want to order unicorn steak")
        assert "couldn't find" in response.lower() or "menu" in response.lower()

    def test_bill_empty(self, bot: RestaurantChatbot) -> None:
        response = bot.respond("Bill please")
        assert "empty" in response.lower()

    def test_bill_with_items(self, bot: RestaurantChatbot) -> None:
        bot.respond("I want Garlic Bread")
        response = bot.respond("Bill please")
        assert "Garlic Bread" in response
        assert "$" in response

    def test_recommend_response(self, bot: RestaurantChatbot) -> None:
        response = bot.respond("Suggest something")
        assert "recommend" in response.lower() or "Chef" in response


class TestOrderManagement:
    """Tests for order tracking."""

    def test_get_total_empty(self, bot: RestaurantChatbot) -> None:
        assert bot.get_total() == 0.0

    def test_get_total_with_items(self, bot: RestaurantChatbot) -> None:
        bot.respond("I want Garlic Bread")
        bot.respond("I want Coffee")
        expected = MENU["starters"]["Garlic Bread"] + MENU["drinks"]["Coffee"]
        assert abs(bot.get_total() - expected) < 0.01

    def test_clear_order(self, bot: RestaurantChatbot) -> None:
        bot.respond("I want Tiramisu")
        assert len(bot.order) > 0
        bot.clear_order()
        assert len(bot.order) == 0

    def test_get_menu_items(self, bot: RestaurantChatbot) -> None:
        items = bot.get_menu_items()
        assert "Margherita Pizza" in items
        assert "Coffee" in items
        assert len(items) > 10
