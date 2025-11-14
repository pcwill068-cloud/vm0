#!/bin/bash

# Replace makita with vm0 in all relevant files
files_to_update=(
  "e2e/README.md"
  ".github/workflows/turbo.yml"
  ".github/DEPLOYMENT_SETUP.md"
  "README.md"
  "turbo/apps/cli/src/index.ts"
  "turbo/apps/cli/src/__tests__/index.test.ts"
  "turbo/apps/cli/tsconfig.json"
  "turbo/apps/cli/tsup.config.ts"
  "turbo/apps/cli/package.json"
  "turbo/apps/cli/README.md"
  "turbo/apps/cli/CHANGELOG.md"
  "turbo/apps/docs/eslint.config.js"
  "turbo/apps/docs/package.json"
  "turbo/apps/docs/CHANGELOG.md"
  "turbo/package.json"
  "turbo/README.md"
  "turbo/apps/web/CHANGELOG.md"
  "turbo/apps/web/eslint.config.js"
  "turbo/apps/web/package.json"
  "turbo/apps/web/tsconfig.json"
  "turbo/apps/web/app/page.tsx"
  "turbo/apps/web/app/api/hello/route.ts"
  "turbo/packages/typescript-config/package.json"
  "turbo/packages/eslint-config/package.json"
  "turbo/packages/eslint-config/README.md"
  "turbo/packages/ui/tsconfig.json"
  "turbo/packages/core/package.json"
  "turbo/packages/core/CHANGELOG.md"
  "turbo/packages/ui/package.json"
  "turbo/packages/core/README.md"
  "turbo/packages/core/tsconfig.json"
)

for file in "${files_to_update[@]}"; do
  if [ -f "$file" ]; then
    echo "Updating $file..."
    # Replace makita with vm0
    sed -i '' 's/makita/vm0/g' "$file"
    # Replace Makita with Vm0
    sed -i '' 's/Makita/Vm0/g' "$file"
    # Keep e7h4n-makita-cli as e7h4n-vm0-cli for npm package
    sed -i '' 's/e7h4n-vm0-cli/e7h4n-vm0-cli/g' "$file"
  fi
done

echo "All files updated!"
