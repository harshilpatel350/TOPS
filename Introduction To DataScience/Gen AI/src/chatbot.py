"""
Rule-based restaurant chatbot.

No paid APIs — uses keyword matching, intent detection, and a
curated menu to handle ordering, recommendations, and FAQs.
"""

from __future__ import annotations

import logging
import re
from dataclasses import dataclass, field
from typing import Dict, List, Optional

logger = logging.getLogger(__name__)

# ═══════════════════════════════════════════════════════════════════════
# Menu data
# ═══════════════════════════════════════════════════════════════════════
MENU: Dict[str, Dict[str, float]] = {
    "starters": {
        "Bruschetta": 6.99,
        "Garlic Bread": 4.99,
        "Soup of the Day": 5.49,
        "Spring Rolls": 7.49,
        "Caesar Salad": 8.99,
    },
    "mains": {
        "Margherita Pizza": 12.99,
        "Grilled Chicken": 14.99,
        "Pasta Carbonara": 13.49,
        "Veggie Burger": 11.99,
        "Fish and Chips": 13.99,
        "Paneer Tikka Masala": 12.49,
    },
    "desserts": {
        "Chocolate Lava Cake": 7.99,
        "Tiramisu": 6.99,
        "Ice Cream Sundae": 5.99,
        "Fruit Salad": 4.99,
    },
    "drinks": {
        "Lemonade": 3.49,
        "Iced Tea": 3.49,
        "Coffee": 2.99,
        "Mango Lassi": 4.49,
        "Sparkling Water": 2.49,
    },
}

GREETINGS = [
    r"\bhello\b", r"\bhi\b", r"\bhey\b", r"\bgood\s*(morning|afternoon|evening)\b",
    r"\bwhat'?s?\s*up\b",
]

FAREWELL = [r"\bbye\b", r"\bgoodbye\b", r"\bsee\s*you\b", r"\bthanks?\b", r"\bthank\s*you\b"]


# ═══════════════════════════════════════════════════════════════════════
# Chatbot
# ═══════════════════════════════════════════════════════════════════════
@dataclass
class RestaurantChatbot:
    """Interactive restaurant chatbot with order tracking.

    Attributes:
        name:  Name of the restaurant.
        order: Current order as a list of ``(item, price)`` tuples.
    """

    name: str = "GenAI Bistro"
    order: List[tuple[str, float]] = field(default_factory=list)

    # ── Intent detection ───────────────────────────────────────────
    @staticmethod
    def _match_any(text: str, patterns: list[str]) -> bool:
        """Return ``True`` if *text* matches any regex pattern."""
        for pat in patterns:
            if re.search(pat, text, re.IGNORECASE):
                return True
        return False

    def detect_intent(self, message: str) -> str:
        """Classify user message into an intent category.

        Args:
            message: Raw user input.

        Returns:
            Intent string: ``"greeting"``, ``"farewell"``, ``"menu"``,
            ``"order"``, ``"recommend"``, ``"bill"``, ``"help"``,
            or ``"unknown"``.
        """
        msg = message.lower().strip()
        if self._match_any(msg, GREETINGS):
            return "greeting"
        if self._match_any(msg, FAREWELL):
            return "farewell"
        if re.search(r"\bmenu\b", msg):
            return "menu"
        if re.search(r"\b(order|add|want|i'?d?\s*like|give\s*me)\b", msg):
            return "order"
        if re.search(r"\b(recommend|suggest|popular|best|special)\b", msg):
            return "recommend"
        if re.search(r"\b(bill|total|check|pay|checkout)\b", msg):
            return "bill"
        if re.search(r"\b(help|option|how|what\s*can)\b", msg):
            return "help"
        return "unknown"

    # ── Response generation ────────────────────────────────────────
    def respond(self, message: str) -> str:
        """Generate a response to the user message.

        Args:
            message: Raw user input.

        Returns:
            Bot response string.
        """
        intent = self.detect_intent(message)
        logger.info("Detected intent: %s", intent)

        if intent == "greeting":
            return (
                f"Welcome to {self.name}! 🍽️\n"
                "I can show you our menu, take your order, or make recommendations.\n"
                "Just say 'menu', 'recommend', or tell me what you'd like to order!"
            )

        if intent == "farewell":
            total = self.get_total()
            if self.order:
                return (
                    f"Thank you for dining with us at {self.name}! "
                    f"Your total was ${total:.2f}. Have a wonderful day! 👋"
                )
            return f"Thank you for visiting {self.name}! Come back soon! 👋"

        if intent == "menu":
            return self._format_menu()

        if intent == "order":
            return self._process_order(message)

        if intent == "recommend":
            return self._get_recommendation()

        if intent == "bill":
            return self._format_bill()

        if intent == "help":
            return (
                "Here's what I can do:\n"
                "• Say 'menu' to see our full menu\n"
                "• Say 'order <item>' to add items\n"
                "• Say 'recommend' for today's picks\n"
                "• Say 'bill' to see your order total\n"
                "• Say 'bye' when you're done"
            )

        return (
            "I'm not sure I understood that. Try saying 'menu' to browse, "
            "'order' to add items, or 'help' for more options."
        )

    # ── Internal helpers ───────────────────────────────────────────
    def _format_menu(self) -> str:
        lines = [f"📋  **{self.name} Menu**\n"]
        for category, items in MENU.items():
            lines.append(f"\n🔸 {category.upper()}")
            for item, price in items.items():
                lines.append(f"   {item:.<30s} ${price:.2f}")
        return "\n".join(lines)

    def _process_order(self, message: str) -> str:
        added: List[str] = []
        msg_lower = message.lower()
        for _cat, items in MENU.items():
            for item, price in items.items():
                if item.lower() in msg_lower:
                    self.order.append((item, price))
                    added.append(f"{item} (${price:.2f})")
        if added:
            return "✅ Added to your order:\n• " + "\n• ".join(added) + f"\nRunning total: ${self.get_total():.2f}"
        return "I couldn't find that item on our menu. Say 'menu' to see available items."

    def _get_recommendation(self) -> str:
        return (
            "⭐ Chef's recommendations today:\n"
            "• 🥗 Caesar Salad — crisp, classic, crowd-favourite\n"
            "• 🍕 Margherita Pizza — freshly baked with basil\n"
            "• 🍰 Chocolate Lava Cake — warm and indulgent\n"
            "• 🥤 Mango Lassi — refreshing finish\n\n"
            "Say 'order <item>' to add any of these!"
        )

    def _format_bill(self) -> str:
        if not self.order:
            return "Your order is empty. Say 'menu' to browse our offerings!"
        lines = ["🧾  **Your Bill**\n"]
        for item, price in self.order:
            lines.append(f"   {item:.<30s} ${price:.2f}")
        total = self.get_total()
        lines.append(f"\n{'TOTAL':.<30s} ${total:.2f}")
        return "\n".join(lines)

    def get_total(self) -> float:
        """Return the current order total.

        Returns:
            Sum of all item prices.
        """
        return sum(price for _, price in self.order)

    def clear_order(self) -> None:
        """Remove all items from the current order."""
        self.order.clear()
        logger.info("Order cleared.")

    def get_menu_items(self) -> List[str]:
        """Return a flat list of all menu item names.

        Returns:
            List of item name strings.
        """
        items: List[str] = []
        for cat_items in MENU.values():
            items.extend(cat_items.keys())
        return items
