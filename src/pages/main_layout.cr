abstract class MainLayout
  include Lucky::HTMLPage

  abstract def content
  abstract def page_title

  # The default page title. It is passed to `Shared::LayoutHead`.
  #
  # Add a `page_title` method to pages to override it. You can also remove
  # This method so every page is required to have its own page title.
  def page_title
    "LuckyDiff"
  end

  def render
    html_doctype

    html lang: "en" do
      m Shared::LayoutHead, page_title: page_title, context: context

      body do
        m Shared::Navbar
        m Shared::FlashMessages, context.flash
        div class: "mx-10 my-6" do
          content
        end
      end
    end
  end
end
