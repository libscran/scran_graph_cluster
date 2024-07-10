<?xml version='1.0' encoding='UTF-8' standalone='yes' ?>
<tagfile doxygen_version="1.9.8">
  <compound kind="file">
    <name>build_snn_graph.hpp</name>
    <path>scran/</path>
    <filename>build__snn__graph_8hpp.html</filename>
    <class kind="struct">scran::build_snn_graph::Options</class>
    <class kind="struct">scran::build_snn_graph::Results</class>
    <namespace>scran::build_snn_graph</namespace>
  </compound>
  <compound kind="file">
    <name>cluster_leiden.hpp</name>
    <path>scran/</path>
    <filename>cluster__leiden_8hpp.html</filename>
    <class kind="struct">scran::cluster_leiden::Options</class>
    <class kind="struct">scran::cluster_leiden::Results</class>
    <namespace>scran::cluster_leiden</namespace>
  </compound>
  <compound kind="file">
    <name>cluster_multilevel.hpp</name>
    <path>scran/</path>
    <filename>cluster__multilevel_8hpp.html</filename>
    <class kind="struct">scran::cluster_multilevel::Options</class>
    <class kind="struct">scran::cluster_multilevel::Results</class>
    <namespace>scran::cluster_multilevel</namespace>
  </compound>
  <compound kind="file">
    <name>cluster_walktrap.hpp</name>
    <path>scran/</path>
    <filename>cluster__walktrap_8hpp.html</filename>
    <class kind="struct">scran::cluster_walktrap::Options</class>
    <class kind="struct">scran::cluster_walktrap::Results</class>
    <namespace>scran::cluster_walktrap</namespace>
  </compound>
  <compound kind="file">
    <name>edges_to_graph.hpp</name>
    <path>scran/</path>
    <filename>edges__to__graph_8hpp.html</filename>
    <namespace>scran::edges_to_graph</namespace>
  </compound>
  <compound kind="struct">
    <name>scran::build_snn_graph::Options</name>
    <filename>structscran_1_1build__snn__graph_1_1Options.html</filename>
    <member kind="variable">
      <type>int</type>
      <name>num_neighbors</name>
      <anchorfile>structscran_1_1build__snn__graph_1_1Options.html</anchorfile>
      <anchor>ac9e9a14d4f7d3b0107b42865f0757316</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>Scheme</type>
      <name>weighting_scheme</name>
      <anchorfile>structscran_1_1build__snn__graph_1_1Options.html</anchorfile>
      <anchor>ad8fc461977df62c4944bf5ed1a30be68</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>num_threads</name>
      <anchorfile>structscran_1_1build__snn__graph_1_1Options.html</anchorfile>
      <anchor>a38ef66f540afe84e10fb8da195a9de91</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>scran::cluster_leiden::Options</name>
    <filename>structscran_1_1cluster__leiden_1_1Options.html</filename>
    <member kind="variable">
      <type>double</type>
      <name>resolution</name>
      <anchorfile>structscran_1_1cluster__leiden_1_1Options.html</anchorfile>
      <anchor>a7d4b09cdf92cdbafea58a978f311a240</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>double</type>
      <name>beta</name>
      <anchorfile>structscran_1_1cluster__leiden_1_1Options.html</anchorfile>
      <anchor>a5bdcac93787ba4edb652cbba5ced7fb6</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>iterations</name>
      <anchorfile>structscran_1_1cluster__leiden_1_1Options.html</anchorfile>
      <anchor>a46245d0121d8a7c9d752eec63edb781a</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>modularity</name>
      <anchorfile>structscran_1_1cluster__leiden_1_1Options.html</anchorfile>
      <anchor>afc69857115157f0f67b15f4d76f0650c</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>report_quality</name>
      <anchorfile>structscran_1_1cluster__leiden_1_1Options.html</anchorfile>
      <anchor>a6535f9f09fd1df597cfd74fc426150d8</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>seed</name>
      <anchorfile>structscran_1_1cluster__leiden_1_1Options.html</anchorfile>
      <anchor>adbd93a887ed0e91cbaa83752efa3c875</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>scran::cluster_multilevel::Options</name>
    <filename>structscran_1_1cluster__multilevel_1_1Options.html</filename>
    <member kind="variable">
      <type>double</type>
      <name>resolution</name>
      <anchorfile>structscran_1_1cluster__multilevel_1_1Options.html</anchorfile>
      <anchor>ae2421f123cd0d889d5f283f9ca64f2cc</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>seed</name>
      <anchorfile>structscran_1_1cluster__multilevel_1_1Options.html</anchorfile>
      <anchor>a25c964496ced5a0986a9f8d2201d4227</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>report_levels</name>
      <anchorfile>structscran_1_1cluster__multilevel_1_1Options.html</anchorfile>
      <anchor>ab5b69bb0ddc9ed6a29c9b56c7bf6626d</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>report_modularity</name>
      <anchorfile>structscran_1_1cluster__multilevel_1_1Options.html</anchorfile>
      <anchor>ae6f042cc260e1872d4f783847ee53da0</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>scran::cluster_walktrap::Options</name>
    <filename>structscran_1_1cluster__walktrap_1_1Options.html</filename>
    <member kind="variable">
      <type>int</type>
      <name>steps</name>
      <anchorfile>structscran_1_1cluster__walktrap_1_1Options.html</anchorfile>
      <anchor>a3f5a7e2c91b50a760a6be290d28d39bf</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>report_merges</name>
      <anchorfile>structscran_1_1cluster__walktrap_1_1Options.html</anchorfile>
      <anchor>a0d9aedc162a88b7c5d30d7e00b808c98</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>report_modularity</name>
      <anchorfile>structscran_1_1cluster__walktrap_1_1Options.html</anchorfile>
      <anchor>aa830e901cc1200b4395147ab8f69a572</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>scran::build_snn_graph::Results</name>
    <filename>structscran_1_1build__snn__graph_1_1Results.html</filename>
    <templarg>typename Node_</templarg>
    <templarg>typename Weight_</templarg>
    <member kind="variable">
      <type>size_t</type>
      <name>num_cells</name>
      <anchorfile>structscran_1_1build__snn__graph_1_1Results.html</anchorfile>
      <anchor>a3cd489f8fac7788740f93d339f0c60db</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::vector&lt; Node_ &gt;</type>
      <name>edges</name>
      <anchorfile>structscran_1_1build__snn__graph_1_1Results.html</anchorfile>
      <anchor>a9977a3e860146f5987ffda656a669b54</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::vector&lt; Weight_ &gt;</type>
      <name>weights</name>
      <anchorfile>structscran_1_1build__snn__graph_1_1Results.html</anchorfile>
      <anchor>ad1da601fcf95566b356bd6941af173af</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>scran::cluster_leiden::Results</name>
    <filename>structscran_1_1cluster__leiden_1_1Results.html</filename>
    <member kind="variable">
      <type>int</type>
      <name>status</name>
      <anchorfile>structscran_1_1cluster__leiden_1_1Results.html</anchorfile>
      <anchor>a883dfe42baa48a35f5ef60ff2e6e25a4</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>raiigraph::IntegerVector</type>
      <name>membership</name>
      <anchorfile>structscran_1_1cluster__leiden_1_1Results.html</anchorfile>
      <anchor>aaeb5da2e6d2273b8bdafefd0ed9ed8c5</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>igraph_real_t</type>
      <name>quality</name>
      <anchorfile>structscran_1_1cluster__leiden_1_1Results.html</anchorfile>
      <anchor>a356ca4d28e89db1f025237c4240929c0</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>scran::cluster_multilevel::Results</name>
    <filename>structscran_1_1cluster__multilevel_1_1Results.html</filename>
    <member kind="variable">
      <type>int</type>
      <name>status</name>
      <anchorfile>structscran_1_1cluster__multilevel_1_1Results.html</anchorfile>
      <anchor>a59dd19765a63053fcd4538af60832931</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>raiigraph::IntegerVector</type>
      <name>membership</name>
      <anchorfile>structscran_1_1cluster__multilevel_1_1Results.html</anchorfile>
      <anchor>a0bfb676e5d63d4d94f0dcd4e5d613012</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>raiigraph::IntegerMatrix</type>
      <name>levels</name>
      <anchorfile>structscran_1_1cluster__multilevel_1_1Results.html</anchorfile>
      <anchor>ac37e76619c176c9df4918eeaa9a15ad8</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>raiigraph::RealVector</type>
      <name>modularity</name>
      <anchorfile>structscran_1_1cluster__multilevel_1_1Results.html</anchorfile>
      <anchor>a77900192b11d16d0d7da9e74bb81c868</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>scran::cluster_walktrap::Results</name>
    <filename>structscran_1_1cluster__walktrap_1_1Results.html</filename>
    <member kind="variable">
      <type>int</type>
      <name>status</name>
      <anchorfile>structscran_1_1cluster__walktrap_1_1Results.html</anchorfile>
      <anchor>a900d4ea723efaaccbb6ea6ea790b6db1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>raiigraph::IntegerVector</type>
      <name>membership</name>
      <anchorfile>structscran_1_1cluster__walktrap_1_1Results.html</anchorfile>
      <anchor>aeac63383b78a56acaf95525b28fb0ba5</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>raiigraph::IntegerMatrix</type>
      <name>merges</name>
      <anchorfile>structscran_1_1cluster__walktrap_1_1Results.html</anchorfile>
      <anchor>aab54e1ba87ea5f986c3a1c6588c8844d</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>raiigraph::RealVector</type>
      <name>modularity</name>
      <anchorfile>structscran_1_1cluster__walktrap_1_1Results.html</anchorfile>
      <anchor>a36b94ef892fbbd68a0666e9738600798</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>scran::build_snn_graph</name>
    <filename>namespacescran_1_1build__snn__graph.html</filename>
    <class kind="struct">scran::build_snn_graph::Options</class>
    <class kind="struct">scran::build_snn_graph::Results</class>
    <member kind="enumeration">
      <type></type>
      <name>Scheme</name>
      <anchorfile>namespacescran_1_1build__snn__graph.html</anchorfile>
      <anchor>a610e9e4165fe86b9903b9dd368695358</anchor>
      <arglist></arglist>
      <enumvalue file="namespacescran_1_1build__snn__graph.html" anchor="a610e9e4165fe86b9903b9dd368695358a586e93720a54998b8bab97579d4bf1a3">RANKED</enumvalue>
      <enumvalue file="namespacescran_1_1build__snn__graph.html" anchor="a610e9e4165fe86b9903b9dd368695358a34f55eca38e0605a84f169ff61a2a396">NUMBER</enumvalue>
      <enumvalue file="namespacescran_1_1build__snn__graph.html" anchor="a610e9e4165fe86b9903b9dd368695358a8827969e98411dcff823da4219cb9467">JACCARD</enumvalue>
    </member>
    <member kind="function">
      <type>void</type>
      <name>compute</name>
      <anchorfile>namespacescran_1_1build__snn__graph.html</anchorfile>
      <anchor>ad7bb15027d07c0c217c0082746bb69ed</anchor>
      <arglist>(size_t num_cells, GetNeighbors_ get_neighbors, GetIndex_ get_index, const Options &amp;options, Results&lt; Node_, Weight_ &gt; &amp;output)</arglist>
    </member>
    <member kind="function">
      <type>Results&lt; Node_, Weight_ &gt;</type>
      <name>compute</name>
      <anchorfile>namespacescran_1_1build__snn__graph.html</anchorfile>
      <anchor>add74d72ecdcd9e644641c06f2760a6cf</anchor>
      <arglist>(const knncolle::NeighborList&lt; Index_, Distance_ &gt; &amp;neighbors, const Options &amp;options)</arglist>
    </member>
    <member kind="function">
      <type>Results&lt; Node_, Weight_ &gt;</type>
      <name>compute</name>
      <anchorfile>namespacescran_1_1build__snn__graph.html</anchorfile>
      <anchor>a232e3a8285f1e19655e9bdc448c3a9e0</anchor>
      <arglist>(const std::vector&lt; std::vector&lt; Index_ &gt; &gt; &amp;neighbors, const Options &amp;options)</arglist>
    </member>
    <member kind="function">
      <type>Results&lt; Node_, Weight_ &gt;</type>
      <name>compute</name>
      <anchorfile>namespacescran_1_1build__snn__graph.html</anchorfile>
      <anchor>a01100b35520ffa85d18a78a588945aff</anchor>
      <arglist>(const knncolle::Prebuilt&lt; Dim_, Index_, Float_ &gt; &amp;prebuilt, const Options &amp;options)</arglist>
    </member>
    <member kind="function">
      <type>Results&lt; Node_, Weight_ &gt;</type>
      <name>compute</name>
      <anchorfile>namespacescran_1_1build__snn__graph.html</anchorfile>
      <anchor>a81cfc0034027c4d19b30295255014cbb</anchor>
      <arglist>(Dim_ num_dims, Index_ num_cells, const Value_ *data, const knncolle::Builder&lt; knncolle::SimpleMatrix&lt; Dim_, Index_, Value_ &gt;, Float_ &gt; &amp;knn_method, const Options &amp;options)</arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>scran::cluster_leiden</name>
    <filename>namespacescran_1_1cluster__leiden.html</filename>
    <class kind="struct">scran::cluster_leiden::Options</class>
    <class kind="struct">scran::cluster_leiden::Results</class>
    <member kind="function">
      <type>void</type>
      <name>compute</name>
      <anchorfile>namespacescran_1_1cluster__leiden.html</anchorfile>
      <anchor>a25a01211932ba9a530018ebd847c5373</anchor>
      <arglist>(const igraph_t *graph, const igraph_vector_t *weights, const Options &amp;options, Results &amp;output)</arglist>
    </member>
    <member kind="function">
      <type>Results</type>
      <name>compute</name>
      <anchorfile>namespacescran_1_1cluster__leiden.html</anchorfile>
      <anchor>a1c5396e3c5aff8a4df01b9d4a5973187</anchor>
      <arglist>(const raiigraph::Graph &amp;graph, const std::vector&lt; igraph_real_t &gt; &amp;weights, const Options &amp;options)</arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>scran::cluster_multilevel</name>
    <filename>namespacescran_1_1cluster__multilevel.html</filename>
    <class kind="struct">scran::cluster_multilevel::Options</class>
    <class kind="struct">scran::cluster_multilevel::Results</class>
    <member kind="function">
      <type>void</type>
      <name>compute</name>
      <anchorfile>namespacescran_1_1cluster__multilevel.html</anchorfile>
      <anchor>a43d8c261ce896162de513bca8e404ced</anchor>
      <arglist>(const igraph_t *graph, const igraph_vector_t *weights, const Options &amp;options, Results &amp;output)</arglist>
    </member>
    <member kind="function">
      <type>Results</type>
      <name>compute</name>
      <anchorfile>namespacescran_1_1cluster__multilevel.html</anchorfile>
      <anchor>a4e99dea62b0ce90081c6fdbb3ba54a63</anchor>
      <arglist>(const raiigraph::Graph &amp;graph, const std::vector&lt; igraph_real_t &gt; &amp;weights, const Options &amp;options)</arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>scran::cluster_walktrap</name>
    <filename>namespacescran_1_1cluster__walktrap.html</filename>
    <class kind="struct">scran::cluster_walktrap::Options</class>
    <class kind="struct">scran::cluster_walktrap::Results</class>
    <member kind="function">
      <type>void</type>
      <name>compute</name>
      <anchorfile>namespacescran_1_1cluster__walktrap.html</anchorfile>
      <anchor>a7c9246f9643ab758e1c267b33d21bc6f</anchor>
      <arglist>(const igraph_t *graph, const igraph_vector_t *weights, const Options &amp;options, Results &amp;output)</arglist>
    </member>
    <member kind="function">
      <type>Results</type>
      <name>compute</name>
      <anchorfile>namespacescran_1_1cluster__walktrap.html</anchorfile>
      <anchor>a100d5974b7717d124868f39f09bf03cc</anchor>
      <arglist>(const raiigraph::Graph &amp;graph, const std::vector&lt; igraph_real_t &gt; &amp;weights, const Options &amp;options)</arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>scran::edges_to_graph</name>
    <filename>namespacescran_1_1edges__to__graph.html</filename>
    <member kind="function">
      <type>raiigraph::Graph</type>
      <name>compute</name>
      <anchorfile>namespacescran_1_1edges__to__graph.html</anchorfile>
      <anchor>a104f876888bc3876453784353cca9079</anchor>
      <arglist>(size_t double_edges, const Vertex_ *edges, size_t num_vertices, igraph_bool_t directed)</arglist>
    </member>
  </compound>
  <compound kind="page">
    <name>index</name>
    <title>Graph-based clustering</title>
    <filename>index.html</filename>
    <docanchor file="index.html" title="Graph-based clustering">md__2github_2workspace_2README</docanchor>
  </compound>
</tagfile>
