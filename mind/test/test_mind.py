#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""Test src src"""

from __future__ import absolute_import
import unittest

from src.common import transparent_func


class TestMind(unittest.TestCase):
    """src ut class"""

    def setUp(self):
        """Set up before every TC"""
        print("Set up")

    def test_me(self):
        """Initial testing"""
        self.assertEqual(
            'transparent_func',
            transparent_func('transparent_func'),
            'Unexpected output')
