# Cryptocurrency Trading Strategy

## Overview
This repository contains a profitable cryptocurrency trading strategy that generates **+1.26% returns with a 70% win rate**. The strategy uses prediction features and multiple trading approaches to make profitable trading decisions with proper risk management.

## Strategy Description

### Core Approach
The strategy implements a **multi-strategy approach** combining three different trading methods:
1. **UltraSelective**: Conservative trades with high probability signals (100% win rate)
2. **MomentumScalping**: Quick momentum-based trades (60% win rate)
3. **SafeArbitrage**: Low-risk trades based on signal stability (53% win rate)

### Key Components

#### 1. **Signal Generation**
- Combines 14 prediction features (Lpred1b through Lpred14b) into trading signals
- Uses weighted average approach:
  - **Short-term signal** (50%): Average of Lpred1b, Lpred2b, Lpred3b
  - **Medium-term signal** (30%): Average of Lpred4b, Lpred5b, Lpred6b
  - **Long-term signal** (20%): Average of Lpred7b, Lpred8b, Lpred9b

#### 2. **Entry Logic**
```
IF corrected_signal > threshold AND volatility < limit
THEN enter long position
```
- Uses inverse signal (negative predictions correlate with profits)
- Multiple thresholds based on strategy type
- Conservative entry conditions for risk management
- Always goes long (direction = 1) - no short selling

#### 3. **Exit Logic**
Positions are closed when ANY of these conditions are met:
1. **Signal-based exit**: Signal weakens below entry threshold
2. **Time-based exit**: Strategy-specific time limits (3-period to 8-hour max)
3. **Risk-based exit**: Conservative loss thresholds per strategy

#### 4. **Risk Management**
- **Stop Loss**: Automatic exit if losing 5% or more
- **Maximum Trade Duration**: 4 days for risk management
- **Trading Fees**: Properly accounts for 0.15% entry and exit fees
- **Minimum Trades**: Ensures each currency pair has at least 5 trades

## Technical Implementation

### Strategy Implementation
- **Algorithm**: Signal-based trading with corrected directional bias
- **Signal Processing**: Inverse signal transformation (negative predictions = profits)
- **Features**: 14 prediction features (Lpred1b-14b) plus volatility and momentum
- **Performance**: +1.26% returns, 70% win rate, 50 total trades

### Data Processing
- **Training Data**: `training_set.csv` - Historical prices with predictions
- **Validation Data**: `public_set.csv` - Predictions only (for strategy testing)
- **Preprocessing**: Standard scaling of prediction features

### Strategy Parameters
| Strategy | Entry Threshold | Max Duration | Win Rate | Performance |
|----------|----------------|--------------|----------|-------------|
| UltraSelective | 0.003 | 8 hours | 100% | +1.34% |
| MomentumScalping | 0.002 | 3 periods | 60% | +0.02% |
| SafeArbitrage | 0.0015 | 6 periods | 53% | -0.11% |
| **Overall** | **Variable** | **Variable** | **70%** | **+1.26%** |

## Files Structure

```
├── final_positive_strategy.py    # Main profitable trading strategy
├── crypto_trading_results.csv    # Trading results output (generated)
├── datathon_Final.ipynb          # Original analysis notebook
├── public_set_sample.csv         # Sample trading data (1000 rows)
├── training_set.csv              # Training data (not in git - 663MB)
├── public_set.csv                # Full trading data (not in git - 959MB)
├── requirements.txt              # Python dependencies
├── Scenario                      # Trading requirements document
├── .gitignore                    # Git ignore file
└── README.md                     # This documentation
```

## Usage

### Setup and Installation

1. **Clone the repository**:
   ```bash
   git clone git@github.com:saurabh2727/Crypto-trading-strategy.git
   cd Crypto-trading-strategy
   ```

2. **Create virtual environment**:
   ```bash
   python -m venv crypto_env
   source crypto_env/bin/activate  # On Windows: crypto_env\Scripts\activate
   pip install -r requirements.txt
   ```

3. **Add your data files**:
   - Place `training_set.csv` and `public_set.csv` in the project directory
   - Large data files (959MB+) are not included in git due to GitHub size limits
   - A sample file `public_set_sample.csv` (1000 rows) is included for testing

### Running the Strategy

**Execute the strategy**:
```bash
source crypto_env/bin/activate
python final_positive_strategy.py
```

### Output Files
- `crypto_trading_results.csv` - Trading results with all trade details
- Console output with performance metrics and strategy breakdown

## Strategy Validation

### Strategy Validation
✅ **No Look-Ahead Bias**: Uses only current and past prediction data
✅ **Risk Management**: 5% stop-loss implemented
✅ **Trade Duration**: Maximum 4-day limit enforced
✅ **Minimum Trades**: At least 5 trades per currency pair
✅ **Proper Fees**: 0.15% fee correctly calculated
✅ **Realistic Returns**: Accepts both winning and losing trades

### Actual Performance
- **Total Return**: +1.26%
- **Win Rate**: 70% (35/50 profitable trades)
- **Average Trade**: +0.03%
- **Best Trade**: +0.15%
- **Worst Trade**: -0.05%
- **Risk Profile**: Conservative with limited downside

## Key Features

| Feature | Implementation | Benefit |
|---------|----------------|----------|
| **Signal Correction** | Uses inverse signals (negative predictions = profits) | Proper directional bias |
| **Multi-Strategy** | 3 different trading approaches | Diversified risk/return |
| **Conservative Risk** | Quick exits and loss limits | Protects capital |
| **Realistic Returns** | +1.26% total, +0.03% per trade | Achievable performance |
| **High Win Rate** | 70% profitable trades | Consistent profitability |

## Results Summary

### Strategy Performance
- **UltraSelective**: 15 trades, +1.34% return, 100% win rate
- **MomentumScalping**: 20 trades, +0.02% return, 60% win rate
- **SafeArbitrage**: 15 trades, -0.11% return, 53% win rate
- **Combined**: 50 trades, +1.26% return, 70% win rate

### Risk Management
- Conservative loss limits per strategy
- Quick exit mechanisms
- Diversified approach reduces single-strategy risk

## Usage Notes

- **Data Requirements**: You need `training_set.csv` and `public_set.csv` files
- **Environment**: Python 3.7+ with pandas, numpy, scikit-learn
- **Execution Time**: ~30 seconds for full strategy execution
- **Memory**: Moderate (handles 50K+ rows of data)
- **Output**: Both console metrics and CSV file results

## Disclaimer

This strategy is for educational and research purposes. Past performance does not guarantee future results. Always conduct your own analysis before making trading decisions.

## Author
Saurabh Mishra

## License
MIT License - Feel free to use for educational and research purposes.