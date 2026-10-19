# Sustainability Impact Analysis | SQL

## Project Overview

This project uses SQL to analyze a hypothetical dataset of electronic devices repurposed in 2024 and evaluate their estimated environmental benefits. The analysis explores energy savings and carbon dioxide (CO₂) reductions across device types, device age groups, and geographic regions to identify opportunities to improve device repurposing strategies.

**Project type:** Academic / Data Analytics Portfolio Project  
**Tools:** SQL, Common Table Expressions (CTEs), window functions, data aggregation, conditional logic

## Business Questions

- How do estimated energy savings differ between laptops and desktops?
- Which device age groups have the greatest estimated environmental impact per device?
- How do estimated CO₂ savings vary across geographic regions?
- Which device types contribute the most to regional energy savings and CO₂ reductions?
- What strategies could help maximize the potential environmental benefits of device repurposing?

## Key Findings

- **601,740 joined records** were analyzed in the dataset.
- The dataset estimated approximately **6,768 metric tons of annual CO₂ savings** across the analyzed records.
- Older devices had the highest estimated per-device annual savings, at approximately **48.02 kWh of energy and 21.01 kg of CO₂**.
- Laptops represented the largest share of analyzed devices and had slightly higher average energy savings per device than desktops.
- Asia had the highest estimated average annual CO₂ savings per device among the three regions, while Europe had the lowest.
- Laptops contributed approximately **68% of regional energy savings and CO₂ reductions**, reflecting their larger share of repurposed devices.

## Methods

The analysis used SQL to:

- Join device information with environmental impact records using `device_id`.
- Calculate device age based on manufacturing year.
- Categorize devices into newer, mid-age, and older groups using `CASE` statements.
- Calculate summary statistics, including device counts, average energy savings, and total estimated CO₂ reductions.
- Compare environmental impact across device types, age groups, and regions.
- Use Common Table Expressions (CTEs) to organize multi-step analysis.
- Apply window functions to calculate each device type's percentage contribution to regional energy savings and CO₂ reductions.

## Recommendations

Based on the hypothetical dataset, organizations could consider:

1. **Prioritizing functional older devices:** Evaluate older devices for repurposing when they remain suitable for reuse, as they showed higher estimated average annual energy and CO₂ savings per device.
2. **Continuing to leverage laptop repurposing:** Laptops represented the largest device category and contributed substantially to total estimated environmental benefits.
3. **Considering regional differences:** Use regional CO₂ savings estimates to help prioritize initiatives, while accounting for differences in electricity emissions and local conditions.
4. **Evaluating cost-effectiveness:** Incorporate repair and repurposing costs into future analyses to identify opportunities that balance environmental benefits with program costs.

## Limitations

This academic portfolio project uses hypothetical and illustrative data provided for a learning exercise. The results are estimates based on the supplied dataset and should not be interpreted as verified environmental outcomes or as work commissioned by Intel.

The analysis does not establish actual lifecycle emissions reductions. Real-world outcomes would depend on factors such as device condition, continued usability, replacement decisions, energy consumption, and regional electricity emissions factors. Cost-effectiveness could not be directly evaluated because cost data was not included in the provided dataset.

## Skills Demonstrated

SQL joins, Common Table Expressions (CTEs), conditional logic, aggregate functions, window functions, data summarization, environmental data analysis, sustainability metrics, and data-driven recommendations.
