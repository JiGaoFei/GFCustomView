

Pod::Spec.new do |s|
s.name         = "GFCustomView"
s.version      = "0.0.8"
s.summary      = "Quickly create rich view"
s.homepage     = "https://github.com/JiGaoFei/GFCustomView"
s.license      = "MIT"
s.author             = {'jigaofei' => '528096212@.qq.com'}
s.platform     = :ios, "8.0"
s.source       = { :git => "https://github.com/JiGaoFei/GFCustomView.git", :tag => s.version}
s.source_files  = "GFCustomView/**/*.{h,m}"
s.resource     = 'GFCustomView/GFCustomView.bundle'
s.requires_arc = true
s.dependency "Masonry"
end
