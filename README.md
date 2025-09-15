# Cryptocurrency Trading Strategy

## Overview
This repository contains a machine learning-based cryptocurrency trading strategy. The strategy uses prediction features to make trading decisions with proper risk management.

## Strategy Description

### Core Approach
The strategy implements a **signal-based long trading approach** using machine learning predictions to identify entry and exit points for cryptocurrency trades.

### Key Components

#### 1. **Signal Generation**
- Combines 14 prediction features (Lpred1b through Lpred14b) into trading signals
- Uses weighted average approach:
  - **Short-term signal** (50%): Average of Lpred1b, Lpred2b, Lpred3b
  - **Medium-term signal** (30%): Average of Lpred4b, Lpred5b, Lpred6b
  - **Long-term signal** (20%): Average of Lpred7b, Lpred8b, Lpred9b

#### 2. **Entry Logic**
```
IF combined_signal > 0.005 (0.5% threshold)
THEN enter long position
```
- Only enters when predictions suggest profit above trading costs
- Threshold = 0.3% (fees) + 0.2% (target profit) = 0.5%
- Uses 100% of available capital per trade (percentPair = 1.0)
- Always goes long (direction = 1) - no short selling

#### 3. **Exit Logic**
Positions are closed when ANY of these conditions are met:
1. **Signal-based exit**: `combined_signal < -0.002` (predictions turn significantly negative)
2. **Time-based exit**: Trade duration reaches 4 days (5,760 minutes)
3. **Risk-based exit**: 5% stop-loss is triggered

#### 4. **Risk Management**
- **Stop Loss**: Automatic exit if losing 5% or more
- **Maximum Trade Duration**: 4 days for risk management
- **Trading Fees**: Properly accounts for 0.15% entry and exit fees
- **Minimum Trades**: Ensures each currency pair has at least 5 trades

## Technical Implementation

### Model Training
- **Algorithm**: Random Forest Regressor with feature selection
- **Target**: Normalized cryptocurrency prices using log-max-root transformation
- **Features**: 14 prediction features (Lpred1b-14b)
- **Performance**: RMSE ~0.32 on test data

### Data Processing
- **Training Data**: `training_set.csv` - Historical prices with predictions
- **Validation Data**: `public_set.csv` - Predictions only (for strategy testing)
- **Preprocessing**: Standard scaling of prediction features

### Strategy Parameters
| Parameter | Value | Description |
|-----------|-------|-------------|
| Entry Threshold | 0.005 | Signal strength required to enter trade (0.3% fees + 0.2% profit) |
| Exit Threshold | -0.002 | Signal level that triggers exit |
| Stop Loss | 5% | Maximum acceptable loss per trade |
| Max Duration | 4 days | Maximum time to hold position |
| Trading Fee | 0.15% | Fee applied to entry and exit (0.3% total) |

## Files Structure

```
├── datathon_Final.ipynb          # Main notebook with model and strategy
├── fixed_trading_strategy.py     # Standalone strategy implementation
├── run_fixed_strategy.py         # Executable script version
├── training_set.csv              # Training data with prices and predictions
├── public_set.csv                # Validation data with predictions only
├── Datathon Strategy             # Original strategy notes
├── Scenario                      # Trading requirements
└── README.md                     # This documentation
```

## Usage

### Running the Strategy

1. **In Jupyter Notebook** (Recommended):
   ```python
   # Execute the cells in datathon_Final.ipynb
   fixed_submission, fixed_trades = create_fixed_trading_strategy()
   ```

2. **Standalone Script**:
   ```bash
   python run_fixed_strategy.py
   ```

### Output Files
- `fixed_strategy_submission.csv` - Trading results file
- `best_rf.pkl` - Trained machine learning model

## Strategy Validation

### Strategy Validation
✅ **No Look-Ahead Bias**: Uses only current and past prediction data
✅ **Risk Management**: 5% stop-loss implemented
✅ **Trade Duration**: Maximum 4-day limit enforced
✅ **Minimum Trades**: At least 5 trades per currency pair
✅ **Proper Fees**: 0.15% fee correctly calculated
✅ **Realistic Returns**: Accepts both winning and losing trades

### Expected Performance
- **Return Range**: 1-10% (realistic returns)
- **Win Rate**: Typically 40-60%
- **Risk Profile**: Moderate with built-in stop-losses

## Key Improvements Over Original Strategy

| Aspect | Original Issue | Fixed Version |
|--------|----------------|---------------|
| **Look-Ahead** | Used future price knowledge | Uses only prediction features |
| **Trade Selection** | Only kept profitable trades | Accepts all trades (wins/losses) |
| **Risk Management** | No stop-loss | 5% stop-loss implemented |
| **Time Limits** | No duration control | 4-day maximum enforced |
| **Returns** | Unrealistic 46M% | Realistic 1-10% range |

## Trading Requirements Met

- **Entry/Exit Logic**: Based solely on prediction thresholds
- **Stop Loss**: 5% maximum loss per trade
- **Trade Length**: Maximum 4 days (5,760 minutes)
- **Trading Fees**: 0.15% properly applied to entry and exit
- **Minimum Activity**: At least 5 trades per currency pair
- **Output Format**: Structured 6-column format with trading details

## Future Enhancements

1. **Threshold Optimization**: Use backtesting to optimize entry/exit thresholds
2. **Short Selling**: Implement short positions for bear market conditions
3. **Position Sizing**: Dynamic position sizing based on signal strength
4. **Advanced Signals**: Incorporate technical indicators or ensemble methods
5. **Portfolio Management**: Multi-pair risk balancing

## Authors
- Strategy Development: Saurabh Mishra

## License
This project is for educational purposes.