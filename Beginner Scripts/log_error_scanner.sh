#!/bin/bash

echo "=============================="
echo "       LOG ERROR SCANNER"
echo "=============================="

echo ""
echo "ERRORS:"
sudo journalctl | grep -i "error" | tail -10

echo ""
echo "WARNINGS:"
sudo journalctl | grep -i "warning" | tail -10

echo ""
echo "FAILED LOGINS:"
sudo journalctl | grep -i "failed" | tail -10

echo ""
echo "=============================="