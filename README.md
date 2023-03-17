
[![New Relic Experimental header](https://github.com/newrelic/opensource-website/raw/master/src/images/categories/Experimental.png)](https://opensource.newrelic.com/oss-category/#new-relic-experimental)


## How to monitor Github Actions with New Relic
Now, you can monitor your Github Actions with New Relic using Github Actions New Relic Exporter, making it easier to get observability into your CI/CD workflows health and performance.

You will be able to:

- Visualise key metrics on your Github Actions, such as how long your workflow/jobs/steps are taking, how often they are failing.
- Visualise workflows/jobs and steps as distributed traces with logs in context
- Pinpoint where issues are coming from in your workflows
- Create alerts on your workflows.

## How to 

Configuring the exporter

Before setting up the integration, you will need a New Relic ingest API key.


1. Configure your New Relic API key as secret in your repository, called it `NEW_RELIC_API_KEY`
2. The exporter uses automatic token authentication by default, for this you need to ensure that GITHUB_TOKEN has at least read access to the action scope. Alternatively, you can use a Personal Access Token, in this case, configure your PAT token as secret in your repository, called it `GHA_TOKEN`


Add `new-relic-exporter.yaml` to .github/workflows

```
name: new-relic-exporter

on:
  workflow_run:
    workflows: ['*']
    types: [completed] # defaults to run on every completed workflow run event
  
env:
  GHA_TOKEN: ${{ secrets.GHA_TOKEN }}
  NEW_RELIC_API_KEY: ${{ secrets.NEW_RELIC_API_KEY }}
  GHA_RUN_ID: ${{ github.event.workflow_run.id }}
  GHA_RUN_NAME: ${{ github.event.workflow_run.name }}

jobs:
  new-relic-exporter:
    name: new-relic-exporter
    runs-on: ubuntu-latest
    if: ${{ always() }}
    steps:
      - name: Checkout
        uses: actions/checkout@v3
      - name: new-relic-exporter
        uses: dpacheconr/gha-new-relic-exporter@latest
```

## Contributing

We encourage your contributions to improve [Github Actions New Relic Exporter](../../)! Keep in mind when you submit your pull request, you'll need to sign the CLA via the click-through using CLA-Assistant. You only have to sign the CLA one time per project. If you have any questions, or to execute our corporate CLA, required if your contribution is on behalf of a company, please drop us an email at opensource@newrelic.com.

**A note about vulnerabilities**

As noted in our [security policy](../../security/policy), New Relic is committed to the privacy and security of our customers and their data. We believe that providing coordinated disclosure by security researchers and engaging with the security community are important means to achieve our security goals.

If you believe you have found a security vulnerability in this project or any of New Relic's products or websites, we welcome and greatly appreciate you reporting it to New Relic through [HackerOne](https://hackerone.com/newrelic).

## License

Github Actions New Relic Exporter is licensed under the [Apache 2.0](http://apache.org/licenses/LICENSE-2.0.txt) License.

>Github Actions New Relic Exporter also use source code from third-party libraries. You can find full details on which libraries are used and the terms under which they are licensed in the third-party notices document.














