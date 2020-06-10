# MergeDataSet

This repository groups a set of merge scenarios with known semantic conflicts, which were collected from related studies.

The scenarios are grouped by projects, which may have different merge scenarios. For each merge scenario, you can find:
1. Two projects versions associated with each commit of the merge scenario;
  * Original version: jar files generated using the original source code.
  * Transformed version: jar files generated using transformed code; these transformations change the method and attribute  visibility, and inclusion of empty constructor in the class and its dependencies, where the semantic conflict happen.
2. The different versions of the class file, that holds the semantic conflict;
3. A README file with guidelines to build each commit locally.

## Semantic Conflicts - CVS File
The file [sample-semantic-conflicts.csv](https://github.com/spgroup/mergedataset/blob/master/semantic-conflicts/sample-semantic-conflicts.csv) groups the merge scenarios that are part of our dataset. In this file, you can find:
1. Sample: the original study that identified the semantic conflict
2. Semantic conflict: a boolean value that indicates the occurrence of a semantic conflict
3. Commit: merge commit associated with the merge scenario
4. Project: original project, where the semantic conflict was found
5. Class: class where the semantic conflict was found
6. Build manager: assistant used to manage the project dependencies
7. Original version: link for the jar files generated from the original project version
8. Transformed version: link for the jar files generated from the transformed project version
