<?xml version='1.0' encoding='UTF-8' standalone='yes' ?>
<tagfile doxygen_version="1.12.0">
  <compound kind="file">
    <name>build_snn_graph.hpp</name>
    <path>scran_graph_cluster/</path>
    <filename>build__snn__graph_8hpp.html</filename>
    <class kind="struct">scran_graph_cluster::BuildSnnGraphOptions</class>
    <class kind="struct">scran_graph_cluster::BuildSnnGraphResults</class>
    <namespace>scran_graph_cluster</namespace>
  </compound>
  <compound kind="file">
    <name>cluster_leiden.hpp</name>
    <path>scran_graph_cluster/</path>
    <filename>cluster__leiden_8hpp.html</filename>
    <class kind="struct">scran_graph_cluster::ClusterLeidenOptions</class>
    <class kind="struct">scran_graph_cluster::ClusterLeidenResults</class>
    <namespace>scran_graph_cluster</namespace>
  </compound>
  <compound kind="file">
    <name>cluster_multilevel.hpp</name>
    <path>scran_graph_cluster/</path>
    <filename>cluster__multilevel_8hpp.html</filename>
    <class kind="struct">scran_graph_cluster::ClusterMultilevelOptions</class>
    <class kind="struct">scran_graph_cluster::ClusterMultilevelResults</class>
    <namespace>scran_graph_cluster</namespace>
  </compound>
  <compound kind="file">
    <name>cluster_walktrap.hpp</name>
    <path>scran_graph_cluster/</path>
    <filename>cluster__walktrap_8hpp.html</filename>
    <class kind="struct">scran_graph_cluster::ClusterWalktrapOptions</class>
    <class kind="struct">scran_graph_cluster::ClusterWalktrapResults</class>
    <namespace>scran_graph_cluster</namespace>
  </compound>
  <compound kind="file">
    <name>edges_to_graph.hpp</name>
    <path>scran_graph_cluster/</path>
    <filename>edges__to__graph_8hpp.html</filename>
    <namespace>scran_graph_cluster</namespace>
  </compound>
  <compound kind="file">
    <name>scran_graph_cluster.hpp</name>
    <path>scran_graph_cluster/</path>
    <filename>scran__graph__cluster_8hpp.html</filename>
    <includes id="build__snn__graph_8hpp" name="build_snn_graph.hpp" local="yes" import="no" module="no" objc="no">build_snn_graph.hpp</includes>
    <includes id="cluster__multilevel_8hpp" name="cluster_multilevel.hpp" local="yes" import="no" module="no" objc="no">cluster_multilevel.hpp</includes>
    <includes id="cluster__leiden_8hpp" name="cluster_leiden.hpp" local="yes" import="no" module="no" objc="no">cluster_leiden.hpp</includes>
    <includes id="cluster__walktrap_8hpp" name="cluster_walktrap.hpp" local="yes" import="no" module="no" objc="no">cluster_walktrap.hpp</includes>
    <namespace>scran_graph_cluster</namespace>
  </compound>
  <compound kind="struct">
    <name>scran_graph_cluster::BuildSnnGraphOptions</name>
    <filename>structscran__graph__cluster_1_1BuildSnnGraphOptions.html</filename>
    <member kind="variable">
      <type>int</type>
      <name>num_neighbors</name>
      <anchorfile>structscran__graph__cluster_1_1BuildSnnGraphOptions.html</anchorfile>
      <anchor>a18c2ab10d91d0d369ffbb2de073477fc</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>SnnWeightScheme</type>
      <name>weighting_scheme</name>
      <anchorfile>structscran__graph__cluster_1_1BuildSnnGraphOptions.html</anchorfile>
      <anchor>ad0216c58dfc31ec1bd383a0b7bbd7b3c</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>num_threads</name>
      <anchorfile>structscran__graph__cluster_1_1BuildSnnGraphOptions.html</anchorfile>
      <anchor>a0abf3411731be852935ab5319ec28f97</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>scran_graph_cluster::BuildSnnGraphResults</name>
    <filename>structscran__graph__cluster_1_1BuildSnnGraphResults.html</filename>
    <templarg>typename Node_</templarg>
    <templarg>typename Weight_</templarg>
    <member kind="variable">
      <type>Node_</type>
      <name>num_cells</name>
      <anchorfile>structscran__graph__cluster_1_1BuildSnnGraphResults.html</anchorfile>
      <anchor>a1cd6cc3c7ed80966cc734bb42a2db56b</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::vector&lt; Node_ &gt;</type>
      <name>edges</name>
      <anchorfile>structscran__graph__cluster_1_1BuildSnnGraphResults.html</anchorfile>
      <anchor>a6b513245799f779cbc00f4a2c4aa4089</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::vector&lt; Weight_ &gt;</type>
      <name>weights</name>
      <anchorfile>structscran__graph__cluster_1_1BuildSnnGraphResults.html</anchorfile>
      <anchor>aafc31c61931638d6b6998a7a2e809503</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>scran_graph_cluster::ClusterLeidenOptions</name>
    <filename>structscran__graph__cluster_1_1ClusterLeidenOptions.html</filename>
    <member kind="variable">
      <type>igraph_real_t</type>
      <name>resolution</name>
      <anchorfile>structscran__graph__cluster_1_1ClusterLeidenOptions.html</anchorfile>
      <anchor>ad78942181fedf052eeb39495fc73e095</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>igraph_real_t</type>
      <name>beta</name>
      <anchorfile>structscran__graph__cluster_1_1ClusterLeidenOptions.html</anchorfile>
      <anchor>aa676fa098c68af4995b96daefebce01d</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>igraph_int_t</type>
      <name>iterations</name>
      <anchorfile>structscran__graph__cluster_1_1ClusterLeidenOptions.html</anchorfile>
      <anchor>a0988e1b77dfd73f2bcf5d48799cea882</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>igraph_leiden_objective_t</type>
      <name>objective</name>
      <anchorfile>structscran__graph__cluster_1_1ClusterLeidenOptions.html</anchorfile>
      <anchor>ab57b699f0f971ab3c81412ecaa3fa90a</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>report_quality</name>
      <anchorfile>structscran__graph__cluster_1_1ClusterLeidenOptions.html</anchorfile>
      <anchor>aadeaeb675b5147bad420a2c49d5e1230</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>igraph_uint_t</type>
      <name>seed</name>
      <anchorfile>structscran__graph__cluster_1_1ClusterLeidenOptions.html</anchorfile>
      <anchor>a7498ab9f212774db522ab1cbebfd3127</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>scran_graph_cluster::ClusterLeidenResults</name>
    <filename>structscran__graph__cluster_1_1ClusterLeidenResults.html</filename>
    <member kind="variable">
      <type>igraph_error_t</type>
      <name>status</name>
      <anchorfile>structscran__graph__cluster_1_1ClusterLeidenResults.html</anchorfile>
      <anchor>aa58800411327b93c76d70a446af77262</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>raiigraph::IntegerVector</type>
      <name>membership</name>
      <anchorfile>structscran__graph__cluster_1_1ClusterLeidenResults.html</anchorfile>
      <anchor>a73bd4882b4c2a0cf97f15967b55db53a</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>igraph_real_t</type>
      <name>quality</name>
      <anchorfile>structscran__graph__cluster_1_1ClusterLeidenResults.html</anchorfile>
      <anchor>a3d3b9954ac37cb27ad09deaa285b4a37</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>scran_graph_cluster::ClusterMultilevelOptions</name>
    <filename>structscran__graph__cluster_1_1ClusterMultilevelOptions.html</filename>
    <member kind="variable">
      <type>igraph_real_t</type>
      <name>resolution</name>
      <anchorfile>structscran__graph__cluster_1_1ClusterMultilevelOptions.html</anchorfile>
      <anchor>a007ca1e328365437ce0d91f4a97b2135</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>igraph_uint_t</type>
      <name>seed</name>
      <anchorfile>structscran__graph__cluster_1_1ClusterMultilevelOptions.html</anchorfile>
      <anchor>aa8a20308154f0ff039bab8062e235b70</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>report_levels</name>
      <anchorfile>structscran__graph__cluster_1_1ClusterMultilevelOptions.html</anchorfile>
      <anchor>ad7c2bdae68800457755b037597fc8b26</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>report_modularity</name>
      <anchorfile>structscran__graph__cluster_1_1ClusterMultilevelOptions.html</anchorfile>
      <anchor>a6449c6c2146ccefa00e0338126181c0a</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>scran_graph_cluster::ClusterMultilevelResults</name>
    <filename>structscran__graph__cluster_1_1ClusterMultilevelResults.html</filename>
    <member kind="variable">
      <type>igraph_error_t</type>
      <name>status</name>
      <anchorfile>structscran__graph__cluster_1_1ClusterMultilevelResults.html</anchorfile>
      <anchor>a7b5a99c46328b2b34944d9351b6476ce</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>raiigraph::IntegerVector</type>
      <name>membership</name>
      <anchorfile>structscran__graph__cluster_1_1ClusterMultilevelResults.html</anchorfile>
      <anchor>a98e0723ac43f5423436e19a21e64d2e5</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>raiigraph::IntegerMatrix</type>
      <name>levels</name>
      <anchorfile>structscran__graph__cluster_1_1ClusterMultilevelResults.html</anchorfile>
      <anchor>ad1b4a75e409febf1a270fb8d623b8852</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>raiigraph::RealVector</type>
      <name>modularity</name>
      <anchorfile>structscran__graph__cluster_1_1ClusterMultilevelResults.html</anchorfile>
      <anchor>a89c2ade042c222cb505be31cb33996db</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>scran_graph_cluster::ClusterWalktrapOptions</name>
    <filename>structscran__graph__cluster_1_1ClusterWalktrapOptions.html</filename>
    <member kind="variable">
      <type>igraph_int_t</type>
      <name>steps</name>
      <anchorfile>structscran__graph__cluster_1_1ClusterWalktrapOptions.html</anchorfile>
      <anchor>ac924d0da946b0a68082872ecee8913aa</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>report_merges</name>
      <anchorfile>structscran__graph__cluster_1_1ClusterWalktrapOptions.html</anchorfile>
      <anchor>ae6b82840666b8c20a2094db4ab5316f2</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>report_modularity</name>
      <anchorfile>structscran__graph__cluster_1_1ClusterWalktrapOptions.html</anchorfile>
      <anchor>aff189e2257dd55cc226e686641e73f81</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>scran_graph_cluster::ClusterWalktrapResults</name>
    <filename>structscran__graph__cluster_1_1ClusterWalktrapResults.html</filename>
    <member kind="variable">
      <type>igraph_error_t</type>
      <name>status</name>
      <anchorfile>structscran__graph__cluster_1_1ClusterWalktrapResults.html</anchorfile>
      <anchor>aab7f74069b6d815a443119a6ad4e2593</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>raiigraph::IntegerVector</type>
      <name>membership</name>
      <anchorfile>structscran__graph__cluster_1_1ClusterWalktrapResults.html</anchorfile>
      <anchor>a109fc45376921267fac2881bafd96994</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>raiigraph::IntegerMatrix</type>
      <name>merges</name>
      <anchorfile>structscran__graph__cluster_1_1ClusterWalktrapResults.html</anchorfile>
      <anchor>a5176208721feefcd701b7e4c28186d2a</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>raiigraph::RealVector</type>
      <name>modularity</name>
      <anchorfile>structscran__graph__cluster_1_1ClusterWalktrapResults.html</anchorfile>
      <anchor>af018a40c2ec372e7309266c45beb7622</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>scran_graph_cluster</name>
    <filename>namespacescran__graph__cluster.html</filename>
    <class kind="struct">scran_graph_cluster::BuildSnnGraphOptions</class>
    <class kind="struct">scran_graph_cluster::BuildSnnGraphResults</class>
    <class kind="struct">scran_graph_cluster::ClusterLeidenOptions</class>
    <class kind="struct">scran_graph_cluster::ClusterLeidenResults</class>
    <class kind="struct">scran_graph_cluster::ClusterMultilevelOptions</class>
    <class kind="struct">scran_graph_cluster::ClusterMultilevelResults</class>
    <class kind="struct">scran_graph_cluster::ClusterWalktrapOptions</class>
    <class kind="struct">scran_graph_cluster::ClusterWalktrapResults</class>
    <member kind="typedef">
      <type>int</type>
      <name>DefaultNode</name>
      <anchorfile>namespacescran__graph__cluster.html</anchorfile>
      <anchor>ac4dcb712a766e6c187e61289ce5bd2ab</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>double</type>
      <name>DefaultWeight</name>
      <anchorfile>namespacescran__graph__cluster.html</anchorfile>
      <anchor>a94345511cbc563ce789fa8f6883bbee2</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>SnnWeightScheme</name>
      <anchorfile>namespacescran__graph__cluster.html</anchorfile>
      <anchor>afd97a61efb1483698423b201e4e7dd3f</anchor>
      <arglist></arglist>
      <enumvalue file="namespacescran__graph__cluster.html" anchor="afd97a61efb1483698423b201e4e7dd3fa586e93720a54998b8bab97579d4bf1a3">RANKED</enumvalue>
      <enumvalue file="namespacescran__graph__cluster.html" anchor="afd97a61efb1483698423b201e4e7dd3fa34f55eca38e0605a84f169ff61a2a396">NUMBER</enumvalue>
      <enumvalue file="namespacescran__graph__cluster.html" anchor="afd97a61efb1483698423b201e4e7dd3fa8827969e98411dcff823da4219cb9467">JACCARD</enumvalue>
    </member>
    <member kind="function">
      <type>void</type>
      <name>build_snn_graph</name>
      <anchorfile>namespacescran__graph__cluster.html</anchorfile>
      <anchor>a4e46800e435e9c40623776399081946d</anchor>
      <arglist>(const Index_ num_cells, const GetNeighbors_ get_neighbors, const GetIndex_ get_index, const BuildSnnGraphOptions &amp;options, BuildSnnGraphResults&lt; Node_, Weight_ &gt; &amp;output)</arglist>
    </member>
    <member kind="function">
      <type>BuildSnnGraphResults&lt; Node_, Weight_ &gt;</type>
      <name>build_snn_graph</name>
      <anchorfile>namespacescran__graph__cluster.html</anchorfile>
      <anchor>a3e1cdafb49d79cbb879e9c16b75afb12</anchor>
      <arglist>(const knncolle::NeighborList&lt; Index_, Distance_ &gt; &amp;neighbors, const BuildSnnGraphOptions &amp;options)</arglist>
    </member>
    <member kind="function">
      <type>BuildSnnGraphResults&lt; Node_, Weight_ &gt;</type>
      <name>build_snn_graph</name>
      <anchorfile>namespacescran__graph__cluster.html</anchorfile>
      <anchor>a7b4bf6dca952c29cafc91ac49ce118ef</anchor>
      <arglist>(const std::vector&lt; std::vector&lt; Index_ &gt; &gt; &amp;neighbors, const BuildSnnGraphOptions &amp;options)</arglist>
    </member>
    <member kind="function">
      <type>BuildSnnGraphResults&lt; Node_, Weight_ &gt;</type>
      <name>build_snn_graph</name>
      <anchorfile>namespacescran__graph__cluster.html</anchorfile>
      <anchor>afb4a0a02c439c6c87e6f08a33b17c03d</anchor>
      <arglist>(const knncolle::Prebuilt&lt; Index_, Input_, Distance_ &gt; &amp;prebuilt, const BuildSnnGraphOptions &amp;options)</arglist>
    </member>
    <member kind="function">
      <type>BuildSnnGraphResults&lt; Node_, Weight_ &gt;</type>
      <name>build_snn_graph</name>
      <anchorfile>namespacescran__graph__cluster.html</anchorfile>
      <anchor>ac98a55cdd0911a396b3d81be098959dc</anchor>
      <arglist>(const std::size_t num_dims, const Index_ num_cells, const Input_ *data, const knncolle::Builder&lt; Index_, Input_, Distance_, Matrix_ &gt; &amp;knn_method, const BuildSnnGraphOptions &amp;options)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>cluster_leiden</name>
      <anchorfile>namespacescran__graph__cluster.html</anchorfile>
      <anchor>a7e0fa194d21cbd65d66186ab2c0dc3c0</anchor>
      <arglist>(const igraph_t *graph, const igraph_vector_t *weights, const ClusterLeidenOptions &amp;options, ClusterLeidenResults &amp;output)</arglist>
    </member>
    <member kind="function">
      <type>ClusterLeidenResults</type>
      <name>cluster_leiden</name>
      <anchorfile>namespacescran__graph__cluster.html</anchorfile>
      <anchor>a668653597ebdff4b8a560bf092d5bd8b</anchor>
      <arglist>(const raiigraph::Graph &amp;graph, const std::vector&lt; igraph_real_t &gt; &amp;weights, const ClusterLeidenOptions &amp;options)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>cluster_multilevel</name>
      <anchorfile>namespacescran__graph__cluster.html</anchorfile>
      <anchor>a1dfcd4ef567084c288296e77c4daabb5</anchor>
      <arglist>(const igraph_t *graph, const igraph_vector_t *weights, const ClusterMultilevelOptions &amp;options, ClusterMultilevelResults &amp;output)</arglist>
    </member>
    <member kind="function">
      <type>ClusterMultilevelResults</type>
      <name>cluster_multilevel</name>
      <anchorfile>namespacescran__graph__cluster.html</anchorfile>
      <anchor>a527ad4b8b48f5c976fa37ac0a25b4081</anchor>
      <arglist>(const raiigraph::Graph &amp;graph, const std::vector&lt; igraph_real_t &gt; &amp;weights, const ClusterMultilevelOptions &amp;options)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>cluster_walktrap</name>
      <anchorfile>namespacescran__graph__cluster.html</anchorfile>
      <anchor>aa6b332af6bc15dc8fcc0d974c4d4fc2b</anchor>
      <arglist>(const igraph_t *graph, const igraph_vector_t *weights, const ClusterWalktrapOptions &amp;options, ClusterWalktrapResults &amp;output)</arglist>
    </member>
    <member kind="function">
      <type>ClusterWalktrapResults</type>
      <name>cluster_walktrap</name>
      <anchorfile>namespacescran__graph__cluster.html</anchorfile>
      <anchor>aa82ceda0bfd680ca4439dc83c7fe6939</anchor>
      <arglist>(const raiigraph::Graph &amp;graph, const std::vector&lt; igraph_real_t &gt; &amp;weights, const ClusterWalktrapOptions &amp;options)</arglist>
    </member>
    <member kind="function">
      <type>raiigraph::Graph</type>
      <name>edges_to_graph</name>
      <anchorfile>namespacescran__graph__cluster.html</anchorfile>
      <anchor>acba7ab7ec47934c88e2f34fadbd78253</anchor>
      <arglist>(const std::size_t double_edges, const Vertex_ *const edges, const std::size_t num_vertices, const igraph_bool_t directed)</arglist>
    </member>
  </compound>
  <compound kind="page">
    <name>index</name>
    <title>Graph-based clustering for single-cell data</title>
    <filename>index.html</filename>
    <docanchor file="index.html">md__2github_2workspace_2README</docanchor>
  </compound>
</tagfile>
