-   overwrite the method *testCommonGramsAnalysis* in *org.elasticsearch.index.analysis.commongrams.
    CommonGramsTokenFilterFactoryTests* like this:.
    ```
    @Test
    public void testCommonGramsAnalysis() throws IOException {
        String json = "/org/elasticsearch/index/analysis/commongrams/commongrams.json";
        Settings.Builder settingsBuilder = Settings.settingsBuilder();
        Settings.Builder loadFromStream = settingsBuilder.loadFromStream(json, getClass().getResourceAsStream(json));
        Settings.Builder put = loadFromStream.put("path.home", createHome());
        Settings settings = put.build();
        {
            AnalysisService analysisService = AnalysisTestsHelper.createAnalysisServiceFromSettings(settings);
            Analyzer analyzer = analysisService.analyzer("commongramsAnalyzer").analyzer();
            String source = "the quick brown is a fox or not";
            String[] expected = new String[] { "the", "quick", "quick_brown", "brown", "brown_is", "is", "a", "a_fox", "fox", "fox_or", "or", "not" };
            assertTokenStreamContents(analyzer.tokenStream("test", source), expected);
        }
        {
            AnalysisService analysisService = AnalysisTestsHelper.createAnalysisServiceFromSettings(settings);
            Analyzer analyzer = analysisService.analyzer("commongramsAnalyzer_file").analyzer();
            String source = "the quick brown is a fox or not";
            String[] expected = new String[] { "the", "quick", "quick_brown", "brown", "brown_is", "is", "a", "a_fox", "fox", "fox_or", "or", "not" };
            assertTokenStreamContents(analyzer.tokenStream("test", source), expected);
        }
    }
    ```
