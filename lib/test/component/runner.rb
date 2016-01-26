module Test
  module Component
    class Runner
      attr_reader :args

      def initialize(args)
        @args = args
      end

      def run!
        if bannerize?
          puts bannerize(hello!)
        else
          puts hello!
        end
      end

      def bannerize(saying)
        "
        ###########################
        #                         #
        #  #{saying}           #
        #                         #
        ###########################
        "
      end

      def bannerize?
        args.include?('--bannerize')
      end

      def hello!
        if customize?
          os = get_os_name
          greeting = "Hello #{os}!"
        else
          greeting = "Hello World!"
        end

        greeting
      end

      def customize?
        args.include?('--customize')
      end

      def get_os_name
        case RbConfig::CONFIG['target_os']
        when /mingw/   then 'windows'
        when /darwin/  then 'osx'
        when /linux/   then 'linux'
        end
      end
    end
  end
end
