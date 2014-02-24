class foo {

  $bar_options = is_hash(hiera('foo::bar::options', false))
  if $bar_options == true {
    # fail ( $bar_options )
    contain foo::bar
  }

}
